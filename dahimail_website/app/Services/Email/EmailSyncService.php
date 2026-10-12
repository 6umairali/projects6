<?php

namespace App\Services\Email;

use App\Models\Attachment;
use App\Models\Contact;
use App\Models\Conversation;
use App\Models\EmailAccount;
use App\Models\Message;
use Google\Client as GoogleClient;
use Google\Service\Gmail;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;
use Microsoft\Graph\Generated\Models\Message as GraphMessage;
use Microsoft\Graph\GraphServiceClient;
use Microsoft\Kiota\Authentication\Oauth\AuthorizationCodeContext;
use Webklex\PHPIMAP\ClientManager;
use Webklex\PHPIMAP\Message as ImapMessage;

class EmailSyncService
{
    /**
     * Sync emails from a connected account.
     * Returns the count of new messages synced.
     */
    public function syncAccount(EmailAccount $account): int
    {
        if ($account->status === 'disconnected') {
            Log::warning("EmailSync: Account {$account->id} is disconnected, skipping.");
            return 0;
        }

        try {
            $count = match ($account->provider) {
                'imap', 'custom' => $this->syncImap($account),
                'gmail' => $this->syncGmail($account),
                'outlook' => $this->syncOutlook($account),
                default => throw new \InvalidArgumentException("Unsupported provider: {$account->provider}"),
            };

            $account->update([
                'last_synced_at' => now(),
                'status' => 'connected',
                'error_message' => null,
            ]);

            Log::info("EmailSync: Synced {$count} new messages for account {$account->id} ({$account->email})");

            return $count;
        } catch (\Throwable $e) {
            Log::error("EmailSync: Failed for account {$account->id}: {$e->getMessage()}", [
                'account_id' => $account->id,
                'provider' => $account->provider,
                'trace' => $e->getTraceAsString(),
            ]);

            // Store the error message but do NOT change status here —
            // the calling job manages retries and only marks as 'error'
            // after all attempts are exhausted.
            $account->update([
                'error_message' => Str::limit($e->getMessage(), 200),
            ]);

            throw $e;
        }
    }

    /**
     * Fetch exactly $limit emails, save to DB, return [count, hasMore].
     * Called by AJAX in a loop — each call is fast, no timeout.
     *
     * @return array{0: int, 1: bool} [synced_count, has_more]
     */
    public function syncBatch(EmailAccount $account, int $limit = 10): array
    {
        if ($account->status === 'disconnected') return [0, false];

        return match ($account->provider) {
            'gmail' => $this->syncGmailBatch($account, $limit),
            'imap', 'custom' => $this->syncImapBatch($account, $limit),
            'outlook' => $this->syncOutlookBatch($account, $limit),
            default => [0, false],
        };
    }

    /**
     * Gmail: fetch one page of emails, save with body, return fast.
     *
     * The JS inbox loop calls this repeatedly (every ~1s) while has_more=true,
     * so the inbox fills up quickly on first connect without a long-running job.
     *
     * Backfill state lives in email_accounts.sync_folders['INBOX']:
     *   - backfill_done: bool           -- true once full history is imported
     *   - backfill_page_token: string   -- resume cursor during backfill
     *
     * While backfill_done is false we ignore the `after:` filter and walk
     * every inbox message, persisting the nextPageToken after each page so
     * the next call resumes exactly where we stopped. last_synced_at is only
     * set once the backfill finishes, which is what flips us into incremental
     * mode (fetching just the newly-arrived mail).
     */
    protected function syncGmailBatch(EmailAccount $account, int $limit): array
    {
        // No cross-process lock here: the HTTP AJAX path and the queue worker
        // should run in parallel so the inbox fills quickly. Race protection
        // comes from the message_id_header unique constraint — if both paths
        // happen to fetch the same page, one save wins and the other gets a
        // UniqueConstraintViolationException (caught + ignored downstream).
        // The queue-side ShouldBeUnique still prevents duplicate queue jobs.
        return $this->syncGmailBatchLocked($account, $limit);
    }

    protected function syncGmailBatchLocked(EmailAccount $account, int $limit): array
    {
        $account = $this->refreshGmailTokenLocked($account, 10);

        $client = new GoogleClient();
        $client->setClientId(config('services.google.client_id'));
        $client->setClientSecret(config('services.google.client_secret'));
        $client->setAccessToken([
            'access_token' => $account->oauth_token,
            'refresh_token' => $account->oauth_refresh_token,
            'expires_in' => 3600,
        ]);
        $client->setHttpClient(new \GuzzleHttp\Client(['timeout' => 15, 'connect_timeout' => 5]));

        $gmail = new Gmail($client);
        $newCount = 0;

        // Load backfill state
        $folders = $this->normalizeSyncFolders($account->sync_folders ?? ['INBOX']);
        $inboxState = $folders['INBOX'] ?? ['backfill_done' => false];
        $isBackfilling = ! ($inboxState['backfill_done'] ?? false);

        $params = [
            'maxResults' => max(10, min($limit, 500)), // Gmail max is 500
            'labelIds' => ['INBOX'],
        ];

        if ($isBackfilling) {
            // Walk ALL history, resume from saved token
            if (! empty($inboxState['backfill_page_token'])) {
                $params['pageToken'] = $inboxState['backfill_page_token'];
            }
        } else {
            // Incremental: only mail newer than last successful sync
            if ($account->last_synced_at) {
                $params['q'] = "after:{$account->last_synced_at->timestamp}";
            }
        }

        try {
            $messageList = $gmail->users_messages->listUsersMessages('me', $params);
        } catch (\Throwable $e) {
            Log::warning("EmailSync: Gmail batch list failed: " . Str::limit($e->getMessage(), 100));
            return [0, false];
        }

        $messages = $messageList->getMessages() ?? [];
        $nextPageToken = $messageList->getNextPageToken();

        // Batch-fetch the whole page in one HTTP round-trip.
        $pageIds = array_map(fn ($m) => $m->getId(), $messages);
        $fullMessages = $this->gmailBatchGet($client, $gmail, $pageIds);

        foreach ($pageIds as $id) {
            if (! isset($fullMessages[$id])) continue;
            try {
                if ($this->processGmailMessage($fullMessages[$id], $account)) {
                    $newCount++;
                }
            } catch (\Throwable $e) {
                continue;
            }
        }

        // Checkpoint — persist cursor / completion without clobbering the
        // incremental anchor. last_synced_at must NOT be advanced mid-backfill
        // or we lose the historical tail.
        if ($isBackfilling) {
            if ($nextPageToken) {
                $folders['INBOX']['backfill_page_token'] = $nextPageToken;
                $folders['INBOX']['backfill_done'] = false;
            } else {
                // Backfill finished — flip the flag and anchor incremental to now
                $folders['INBOX']['backfill_done'] = true;
                unset($folders['INBOX']['backfill_page_token']);
                $account->last_synced_at = now();
            }
            $account->sync_folders = $folders;
            $account->status = 'connected';
            $account->error_message = null;
            $account->save();
        } else {
            // Pure incremental — safe to advance the anchor
            $account->update([
                'last_synced_at' => now(),
                'status' => 'connected',
                'error_message' => null,
            ]);
        }

        // has_more is true while there are more pages OR we're still backfilling
        $hasMore = $nextPageToken !== null || ($isBackfilling && ! ($folders['INBOX']['backfill_done'] ?? false));

        return [$newCount, $hasMore];
    }

    /**
     * Shared helper: refresh the account's Google OAuth token under a row lock
     * so concurrent workers can't both burn the same refresh token.
     */
    protected function refreshGmailTokenLocked(EmailAccount $account, int $httpTimeout = 15): EmailAccount
    {
        return DB::transaction(function () use ($account, $httpTimeout) {
            /** @var EmailAccount|null $locked */
            $locked = EmailAccount::lockForUpdate()->find($account->id);
            if (! $locked) {
                throw new \RuntimeException("Email account {$account->id} no longer exists");
            }

            $client = new GoogleClient();
            $client->setClientId(config('services.google.client_id'));
            $client->setClientSecret(config('services.google.client_secret'));
            $client->setHttpClient(new \GuzzleHttp\Client([
                'timeout' => $httpTimeout,
                'connect_timeout' => 5,
            ]));
            $client->setAccessToken([
                'access_token' => $locked->oauth_token,
                'refresh_token' => $locked->oauth_refresh_token,
                'expires_in' => $locked->oauth_token_expires_at
                    ? max(0, $locked->oauth_token_expires_at->diffInSeconds(now(), false))
                    : 3600,
            ]);

            if ($client->isAccessTokenExpired()) {
                $newToken = $client->fetchAccessTokenWithRefreshToken($locked->oauth_refresh_token);
                if (isset($newToken['access_token'])) {
                    $locked->update([
                        'oauth_token' => $newToken['access_token'],
                        'oauth_token_expires_at' => now()->addSeconds($newToken['expires_in'] ?? 3600),
                    ]);
                }
            }

            return $locked;
        });
    }

    /**
     * IMAP: fetch $limit headers + bodies in one shot.
     */
    protected function syncImapBatch(EmailAccount $account, int $limit): array
    {
        // IMAP already has time limits, run full sync
        $count = $this->syncImap($account);
        return [$count, false];
    }

    /**
     * Outlook: fetch $limit messages in one shot.
     */
    protected function syncOutlookBatch(EmailAccount $account, int $limit): array
    {
        $count = $this->syncOutlook($account);
        return [$count, false];
    }

    /**
     * Sync via IMAP using PHP's native ext-imap.
     *
     * Continuously loops through ALL messages in batches of 200 until done.
     * Phase 1: Fast header-only sync — conversations appear in inbox immediately.
     * Phase 2: Body fetch — fills in message content using the already-open connection.
     *
     * Time-limited to 8 minutes to stay within queue job timeout.
     */
    protected function syncImap(EmailAccount $account): int
    {
        // Strip spaces from App Passwords (Gmail generates them with spaces for readability)
        $password = str_replace(' ', '', $account->imap_password ?? '');

        $host = $account->imap_host;
        $port = $account->imap_port ?? 993;
        $encryption = $account->imap_encryption ?? 'ssl';

        $flags = '/imap';
        if ($encryption === 'ssl') {
            $flags .= '/ssl/novalidate-cert';
        } elseif ($encryption === 'tls') {
            $flags .= '/tls/novalidate-cert';
        }

        $syncFoldersRaw = $account->sync_folders ?? ['INBOX'];
        $syncFolders = $this->normalizeSyncFolders($syncFoldersRaw);
        $newCount = 0;
        $startTime = microtime(true);
        // Keep total runtime under the worker's max-time=45 window with
        // headroom so the worker never interrupts mid-save.
        $maxHeaderSeconds = 20; // Phase 1: headers only
        $maxTotalSeconds = 35;  // Phase 2: bodies use remaining time

        foreach ($syncFolders as $folderName => $folderMeta) {
            $mailbox = "{{$host}:{$port}{$flags}}{$folderName}";

            Log::info("EmailSync: Connecting to {$mailbox} for {$account->email}");

            @imap_timeout(IMAP_OPENTIMEOUT, 15);
            @imap_timeout(IMAP_READTIMEOUT, 30);
            @imap_timeout(IMAP_WRITETIMEOUT, 10);

            $mbox = @imap_open($mailbox, $account->imap_username, $password, 0, 1);

            if (! $mbox) {
                $err = imap_last_error();
                Log::error("EmailSync: IMAP open failed for {$account->email}/{$folderName}: {$err}");
                throw new \RuntimeException("IMAP connection failed: {$err}");
            }

            Log::info("EmailSync: Connected to {$account->email}/{$folderName}");

            try {
                $folderLastUid = $folderMeta['last_uid'] ?? null;
                $oldestUid = $folderMeta['oldest_uid'] ?? null;
                $backfillDone = $folderMeta['backfill_done'] ?? false;
                $batchSize = 50;
                $lastUid = $folderLastUid;

                $totalMsgs = @imap_num_msg($mbox);
                if (! $totalMsgs || $totalMsgs === 0) {
                    Log::info("EmailSync: Folder {$folderName} is empty");
                    continue;
                }

                Log::info("EmailSync: {$totalMsgs} messages in {$folderName}");

                // ── Phase 1: Fetch ALL headers in batches of 200, loop until done ──
                // Start from newest and work backwards
                $currentEnd = $totalMsgs;
                $lowestUid = $oldestUid;

                while ($currentEnd >= 1) {
                    // Time guard — stop headers at 25s, leave time for body fetch
                    if ((microtime(true) - $startTime) > $maxHeaderSeconds) {
                        Log::info("EmailSync: Header time limit reached, moving to body fetch");
                        break;
                    }

                    $currentStart = max(1, $currentEnd - $batchSize + 1);

                    Log::info("EmailSync: Fetching headers seq {$currentStart}-{$currentEnd}");
                    $allOverviews = @imap_fetch_overview($mbox, "{$currentStart}:{$currentEnd}", 0) ?: [];

                    if (empty($allOverviews)) {
                        break;
                    }

                    usort($allOverviews, fn ($a, $b) => $a->uid <=> $b->uid);

                    foreach ($allOverviews as $ov) {
                        try {
                            $result = $this->processImapOverview($ov, $account, $folderName);
                            if ($result === true) {
                                $newCount++;
                            }

                            if (! $lastUid || $ov->uid > $lastUid) {
                                $lastUid = $ov->uid;
                            }
                            if (! $lowestUid || $ov->uid < $lowestUid) {
                                $lowestUid = $ov->uid;
                            }
                        } catch (\Throwable $e) {
                            Log::error("EmailSync: Failed to process UID {$ov->uid}: {$e->getMessage()}");
                        }
                    }

                    // Checkpoint progress after each batch so next run doesn't redo work
                    $syncFolders[$folderName]['last_uid'] = $lastUid;
                    $syncFolders[$folderName]['oldest_uid'] = $lowestUid;
                    if ($currentStart <= 1) {
                        $syncFolders[$folderName]['backfill_done'] = true;
                    }
                    $account->update([
                        'sync_folders' => $syncFolders,
                        'last_synced_at' => now(),
                    ]);

                    // Move window backwards
                    $currentEnd = $currentStart - 1;
                }

                // ── Phase 2: Fetch bodies — guaranteed 20 seconds minimum ──
                $bodyCount = 0;
                while ((microtime(true) - $startTime) < $maxTotalSeconds) {
                    // Check IMAP connection is still alive before each batch
                    if (!@imap_ping($mbox)) {
                        Log::warning("EmailSync: IMAP connection dropped during body fetch, reconnecting");
                        @imap_close($mbox);
                        $mbox = @imap_open($mailbox, $account->imap_username, $password, 0, 1);
                        if (!$mbox) {
                            Log::error("EmailSync: IMAP reconnect failed, stopping body fetch");
                            break;
                        }
                    }

                    $messagesNeedingBody = Message::where('workspace_id', $account->workspace_id)
                        ->whereNull('body_html')
                        ->whereNull('body_text')
                        ->whereNotNull('imap_uid')
                        ->where('imap_folder', $folderName)
                        ->orderByDesc('id')
                        ->limit(100)
                        ->get();

                    if ($messagesNeedingBody->isEmpty()) {
                        break;
                    }

                    foreach ($messagesNeedingBody as $msg) {
                        if ((microtime(true) - $startTime) > $maxTotalSeconds) break;
                        try {
                            if ($this->fetchMessageByUid($mbox, $msg, $msg->conversation)) {
                                $bodyCount++;
                            }
                        } catch (\Throwable $e) {
                            Log::warning("EmailSync: Body fetch failed msg={$msg->id}: " . Str::limit($e->getMessage(), 100));
                        }
                    }
                }

                Log::info("EmailSync: {$newCount} headers synced, {$bodyCount} bodies fetched for {$folderName}");
            } finally {
                @imap_close($mbox);
            }
        }

        return $newCount;
    }

    /**
     * Phase 1: Create a conversation + message from IMAP overview data ONLY.
     * Zero extra IMAP calls — uses data already fetched by imap_fetch_overview batch.
     */
    protected function processImapOverview(object $ov, EmailAccount $account, string $folderName = 'INBOX'): bool
    {
        // Use overview's message_id directly (already fetched in batch)
        $messageIdHeader = ! empty($ov->message_id) ? trim($ov->message_id) : null;

        // Skip if already synced
        if ($messageIdHeader && Message::where('message_id_header', $messageIdHeader)
                ->where('workspace_id', $account->workspace_id)->exists()) {
            return false;
        }

        // Parse From from overview string "Name <email>" or just "email"
        $fromAddress = '';
        $fromName = '';
        $fromRaw = $ov->from ?? '';
        if (preg_match('/<([^>]+)>/', $fromRaw, $m)) {
            $fromAddress = $m[1];
            $fromName = trim(str_replace($m[0], '', $fromRaw)) ?: $fromAddress;
            $fromName = @iconv_mime_decode($fromName, 0, 'UTF-8') ?: $fromName;
            $fromName = trim($fromName, '"  ');
        } elseif (filter_var(trim($fromRaw), FILTER_VALIDATE_EMAIL)) {
            $fromAddress = trim($fromRaw);
            $fromName = $fromAddress;
        }

        // Parse To from overview
        $toAddresses = [];
        $toRaw = $ov->to ?? '';
        if (preg_match_all('/<([^>]+)>/', $toRaw, $m)) {
            $toAddresses = $m[1];
        } elseif (filter_var(trim($toRaw), FILTER_VALIDATE_EMAIL)) {
            $toAddresses = [trim($toRaw)];
        }

        $subject = isset($ov->subject) ? @iconv_mime_decode($ov->subject, 0, 'UTF-8') ?: $ov->subject : '(No Subject)';
        $date = isset($ov->date) ? \Carbon\Carbon::parse($ov->date)->utc() : now();

        // Overview provides in_reply_to and references directly
        $inReplyTo = ! empty($ov->in_reply_to) ? trim($ov->in_reply_to) : null;
        $referencesRaw = $ov->references ?? null;
        $referencesArray = $referencesRaw ? preg_split('/\s+/', trim($referencesRaw)) : [];

        $direction = $fromAddress && strtolower($fromAddress) === strtolower($account->email) ? 'outbound' : 'inbound';

        $contact = $this->findOrCreateContact($account, $fromAddress, $fromName, $direction, $toAddresses);
        $conversation = $this->findOrCreateConversation($account, $contact, $subject, $messageIdHeader, $inReplyTo, $referencesArray);

        $preview = Str::limit($subject, 200);

        try {
            $message = DB::transaction(function () use (
                $conversation, $account, $direction, $subject, $fromAddress, $fromName,
                $toAddresses, $messageIdHeader, $inReplyTo, $referencesArray, $date, $ov, $folderName
            ) {
                return Message::create([
                    'conversation_id' => $conversation->id,
                    'workspace_id' => $account->workspace_id,
                    'uuid' => Str::uuid(),
                    'direction' => $direction,
                    'sender_type' => $direction === 'inbound' ? 'contact' : 'user',
                    'sender_id' => $direction === 'outbound' ? $account->user_id : null,
                    'type' => 'message',
                    'body_html' => null,  // Loaded on-demand when user opens
                    'body_text' => null,  // Loaded on-demand when user opens
                    'subject' => $subject,
                    'from_email' => $fromAddress,
                    'from_name' => $fromName,
                    'to_emails' => $toAddresses,
                    'cc_emails' => [],
                    'bcc_emails' => [],
                    'message_id_header' => $messageIdHeader,
                    'in_reply_to' => $inReplyTo,
                    'references_header' => $referencesArray,
                    'delivery_status' => 'delivered',
                    'sent_at' => $date,
                    'delivered_at' => $date,
                    'imap_uid' => $ov->uid ?? null,
                    'imap_folder' => $folderName,
                ]);
            });
        } catch (\Illuminate\Database\UniqueConstraintViolationException $e) {
            return false;
        }

        $conversation->update([
            'last_message_at' => $message->sent_at,
            'preview' => $preview,
            'is_read' => $direction === 'outbound',
        ]);
        $conversation->increment('messages_count');

        return true;
    }

    /**
     * Phase 2: Fetch and store the full message body + attachments for a UID.
     */
    protected function fetchAndUpdateBody($mbox, int $uid, EmailAccount $account): void
    {
        // Get the Message-ID header to find our DB record
        $headerRaw = @imap_fetchheader($mbox, $uid, FT_UID);
        if (! $headerRaw) return;

        $headerObj = imap_rfc822_parse_headers($headerRaw);
        $messageIdHeader = isset($headerObj->message_id) ? trim($headerObj->message_id) : null;
        if (! $messageIdHeader) return;

        $message = Message::where('workspace_id', $account->workspace_id)
            ->where('message_id_header', $messageIdHeader)
            ->whereNull('body_html')
            ->whereNull('body_text')
            ->first();

        if (! $message) return;

        $structure = @imap_fetchstructure($mbox, $uid, FT_UID);
        if (! $structure) return;

        $bodyText = '';
        $bodyHtml = '';
        $attachments = [];
        $this->parseImapParts($mbox, $uid, $structure, '', $bodyText, $bodyHtml, $attachments);

        $message->update([
            'body_html' => $bodyHtml ? Str::limit($bodyHtml, 15000000, '') : null,
            'body_text' => $bodyText ? Str::limit($bodyText, 15000000, '') : null,
        ]);

        // Update conversation preview with actual body text
        if ($bodyText || $bodyHtml) {
            $message->conversation->update([
                'preview' => Str::limit($bodyText ?: strip_tags($bodyHtml ?: ''), 200),
            ]);
        }

        // Save attachments
        foreach ($attachments as $att) {
            $this->saveNativeAttachment($att, $message);
        }
    }

    /**
     * Fetch body for a single message from IMAP.
     */
    /**
     * Fetch a single message body using stored imap_uid (no search needed).
     */
    protected function fetchMessageByUid($mbox, Message $msg, ?Conversation $conversation = null): bool
    {
        $uid = $msg->imap_uid;
        if (! $uid) return false;

        $structure = @imap_fetchstructure($mbox, $uid, FT_UID);
        if (! $structure) return false;

        $bodyText = '';
        $bodyHtml = '';
        $attachments = [];
        $this->parseImapParts($mbox, $uid, $structure, '', $bodyText, $bodyHtml, $attachments);

        $msg->update([
            'body_html' => $bodyHtml ? Str::limit($bodyHtml, 15000000, '') : null,
            'body_text' => $bodyText ? Str::limit($bodyText, 15000000, '') : null,
        ]);

        if (($bodyText || $bodyHtml) && $conversation) {
            $conversation->update([
                'preview' => Str::limit($bodyText ?: strip_tags($bodyHtml ?: ''), 200),
            ]);
        }

        foreach ($attachments as $att) {
            $this->saveNativeAttachment($att, $msg);
        }

        return true;
    }

    /**
     * Fetch all missing message bodies for a conversation in a single IMAP connection.
     */
    public function batchFetchBodiesForConversation(Conversation $conversation, EmailAccount $account): void
    {
        // Get all messages with stored imap_uid that have no body
        $pendingMessages = Message::where('conversation_id', $conversation->id)
            ->whereNull('body_html')
            ->whereNull('body_text')
            ->whereNotNull('imap_uid')
            ->get();

        if ($pendingMessages->isEmpty()) return;

        $password = str_replace(' ', '', $account->imap_password ?? '');
        $host = $account->imap_host;
        $port = $account->imap_port ?? 993;
        $encryption = $account->imap_encryption ?? 'ssl';
        $folder = $pendingMessages->first()->imap_folder ?? 'INBOX';

        $flags = '/imap';
        if ($encryption === 'ssl') {
            $flags .= '/ssl/novalidate-cert';
        } elseif ($encryption === 'tls') {
            $flags .= '/tls/novalidate-cert';
        }

        @imap_timeout(IMAP_OPENTIMEOUT, 15);
        @imap_timeout(IMAP_READTIMEOUT, 15);

        $mbox = @imap_open("{{$host}:{$port}{$flags}}{$folder}", $account->imap_username, $password, 0, 1);
        if (! $mbox) {
            return;
        }

        $fetched = 0;
        try {
            foreach ($pendingMessages as $msg) {
                if ($this->fetchMessageByUid($mbox, $msg, $conversation)) {
                    $fetched++;
                }
            }
        } finally {
            @imap_close($mbox);
        }

    }

    /**
     * Recursively parse IMAP message parts to extract text, HTML, and attachments.
     */
    protected function parseImapParts($mbox, int $uid, object $structure, string $partNumber, string &$bodyText, string &$bodyHtml, array &$attachments): void
    {
        // Multipart message — recurse into sub-parts
        if ($structure->type === 1 && ! empty($structure->parts)) {
            foreach ($structure->parts as $index => $part) {
                $subPart = $partNumber ? "{$partNumber}." . ($index + 1) : (string) ($index + 1);
                $this->parseImapParts($mbox, $uid, $part, $subPart, $bodyText, $bodyHtml, $attachments);
            }
            return;
        }

        // Determine if this part is an attachment
        $isAttachment = false;
        $filename = null;

        if (! empty($structure->ifdparameters) && $structure->ifdparameters) {
            foreach ($structure->dparameters as $param) {
                if (strtolower($param->attribute) === 'filename') {
                    $filename = $param->value;
                    $isAttachment = true;
                }
            }
        }
        if (! $isAttachment && ! empty($structure->ifparameters) && $structure->ifparameters) {
            foreach ($structure->parameters as $param) {
                if (strtolower($param->attribute) === 'name') {
                    $filename = $param->value;
                    $isAttachment = true;
                }
            }
        }

        $section = $partNumber ?: '1';
        $data = @imap_fetchbody($mbox, $uid, $section, FT_UID);

        if ($data === false) return;

        // Decode based on encoding
        $data = match ($structure->encoding ?? 0) {
            3 => base64_decode($data),       // BASE64
            4 => quoted_printable_decode($data), // QUOTED-PRINTABLE
            default => $data,
        };

        // Detect charset and convert to UTF-8
        $charset = 'UTF-8';
        if (! empty($structure->ifparameters) && $structure->ifparameters) {
            foreach ($structure->parameters as $param) {
                if (strtolower($param->attribute) === 'charset') {
                    $charset = strtoupper($param->value);
                    break;
                }
            }
        }
        if ($charset !== 'UTF-8' && $charset !== 'US-ASCII' && $data) {
            $converted = @iconv($charset, 'UTF-8//IGNORE', $data);
            if ($converted !== false) {
                $data = $converted;
            }
        }

        if ($isAttachment && $filename) {
            $contentId = null;
            if (! empty($structure->id)) {
                $contentId = trim($structure->id, '<>');
            }
            $attachments[] = [
                'filename' => iconv_mime_decode($filename, 0, 'UTF-8') ?: $filename,
                'content' => $data,
                'mime_type' => $this->imapMimeType($structure),
                'content_id' => $contentId,
            ];
            return;
        }

        // Text parts
        if ($structure->type === 0) {
            $subtype = strtoupper($structure->subtype ?? 'PLAIN');
            if ($subtype === 'PLAIN' && empty($bodyText)) {
                $bodyText = $data;
            } elseif ($subtype === 'HTML' && empty($bodyHtml)) {
                $bodyHtml = $data;
            }
        }
    }

    /**
     * Get MIME type string from IMAP structure.
     */
    protected function imapMimeType(object $structure): string
    {
        $types = ['text', 'multipart', 'message', 'application', 'audio', 'image', 'video', 'model', 'other'];
        $primary = $types[$structure->type] ?? 'application';
        $sub = strtolower($structure->subtype ?? 'octet-stream');
        return "{$primary}/{$sub}";
    }

    /**
     * Save an attachment from native IMAP parsing.
     */
    protected function saveNativeAttachment(array $att, Message $message): void
    {
        try {
            $maxSize = 25 * 1024 * 1024; // 25 MB
            $content = $att['content'];
            $filename = $att['filename'] ?: ('attachment_' . Str::random(8));

            if (strlen($content) > $maxSize) {
                Log::warning("EmailSync: Attachment too large, skipping", [
                    'message_id' => $message->id,
                    'filename' => $filename,
                    'size' => strlen($content),
                ]);
                return;
            }

            $storagePath = "attachments/{$message->workspace_id}/{$message->id}/{$filename}";
            Storage::put($storagePath, $content);

            Attachment::create([
                'message_id' => $message->id,
                'filename' => $filename,
                'original_filename' => $filename,
                'mime_type' => $att['mime_type'] ?? 'application/octet-stream',
                'size' => strlen($content),
                'storage_path' => $storagePath,
                'is_inline' => ! empty($att['content_id']),
                'content_id' => $att['content_id'] ?? null,
            ]);
        } catch (\Throwable $e) {
            Log::error("EmailSync: Failed to save attachment: {$e->getMessage()}");
        }
    }

    /**
     * Process a single IMAP message.
     */
    protected function processImapMessage(ImapMessage $imapMessage, EmailAccount $account): bool
    {
        $messageIdHeader = $imapMessage->getMessageId()?->toString();

        // Skip if already synced (unique constraint also prevents duplicates at DB level)
        if ($messageIdHeader && Message::where('message_id_header', $messageIdHeader)
                ->where('workspace_id', $account->workspace_id)->exists()) {
            return false;
        }

        // Extract email from From field — webklex returns either Address objects or strings
        $fromRaw = $imapMessage->getFrom()[0] ?? null;
        if (is_object($fromRaw)) {
            $fromAddress = $fromRaw->mail ?? '';
            $fromName = $fromRaw->personal ?? $fromAddress;
        } elseif (is_string($fromRaw)) {
            // Parse "Name <email>" or just "email"
            if (preg_match('/<([^>]+)>/', $fromRaw, $m)) {
                $fromAddress = $m[1];
                $fromName = trim(str_replace($m[0], '', $fromRaw)) ?: $fromAddress;
            } else {
                $fromAddress = trim($fromRaw);
                $fromName = $fromAddress;
            }
        } else {
            $fromAddress = '';
            $fromName = '';
        }

        $subject = $imapMessage->getSubject()?->toString() ?? '(No Subject)';
        $date = $imapMessage->getDate()?->toDate();

        // Parse address lists safely — handle both objects and strings
        $parseAddresses = fn ($list) => collect($list)->map(function ($addr) {
            if (is_object($addr)) return $addr->mail ?? null;
            if (is_string($addr) && preg_match('/<([^>]+)>/', $addr, $m)) return $m[1];
            if (is_string($addr) && filter_var($addr, FILTER_VALIDATE_EMAIL)) return $addr;
            return null;
        })->filter()->values()->toArray();

        $toAddresses = $parseAddresses($imapMessage->getTo());
        $ccAddresses = $parseAddresses($imapMessage->getCc());
        $bccAddresses = $parseAddresses($imapMessage->getBcc());

        $inReplyTo = $imapMessage->getInReplyTo()?->toString();
        $references = $imapMessage->getReferences()?->toString();
        $referencesArray = $references ? preg_split('/\s+/', trim($references)) : [];

        $bodyHtml = $imapMessage->getHTMLBody();
        $bodyText = $imapMessage->getTextBody();

        // Determine direction
        $direction = strtolower($fromAddress) === strtolower($account->email) ? 'outbound' : 'inbound';

        // Find or create contact
        $contact = $this->findOrCreateContact($account, $fromAddress, $fromName, $direction, $toAddresses);

        // Find or create conversation (thread by In-Reply-To / References / Subject)
        $conversation = $this->findOrCreateConversation($account, $contact, $subject, $messageIdHeader, $inReplyTo, $referencesArray);

        // Wrap message + attachment creation in transaction for atomicity
        try {
            $message = DB::transaction(function () use (
                $conversation, $account, $direction, $subject, $fromAddress, $fromName,
                $toAddresses, $ccAddresses, $bccAddresses, $messageIdHeader, $inReplyTo,
                $referencesArray, $bodyHtml, $bodyText, $date, $imapMessage
            ) {
                $message = Message::create([
                    'conversation_id' => $conversation->id,
                    'workspace_id' => $account->workspace_id,
                    'uuid' => Str::uuid(),
                    'direction' => $direction,
                    'sender_type' => $direction === 'inbound' ? 'contact' : 'user',
                    'sender_id' => $direction === 'outbound' ? $account->user_id : null,
                    'type' => 'message',
                    'body_html' => $bodyHtml ? Str::limit($bodyHtml, 15000000, '') : null,
                    'body_text' => $bodyText ? Str::limit($bodyText, 15000000, '') : null,
                    'subject' => $subject,
                    'from_email' => $fromAddress,
                    'from_name' => $fromName,
                    'to_emails' => $toAddresses,
                    'cc_emails' => $ccAddresses,
                    'bcc_emails' => $bccAddresses,
                    'message_id_header' => $messageIdHeader,
                    'in_reply_to' => $inReplyTo,
                    'references_header' => $referencesArray,
                    'delivery_status' => 'delivered',
                    'sent_at' => $date ?? now(),
                    'delivered_at' => $date ?? now(),
                ]);

                // Process attachments inside the transaction
                foreach ($imapMessage->getAttachments() as $attachment) {
                    $this->saveAttachment($attachment, $message);
                }

                return $message;
            });
        } catch (\Illuminate\Database\UniqueConstraintViolationException $e) {
            // Concurrent sync already created this message — skip safely
            return false;
        }

        // Update conversation — use DB increment instead of count() query
        $conversation->update([
            'last_message_at' => $message->sent_at,
            'preview' => Str::limit($bodyText ?? strip_tags($bodyHtml ?? ''), 200),
            'is_read' => $direction === 'outbound',
        ]);
        $conversation->increment('messages_count');

        return true;
    }

    /**
     * Sync via Gmail API.
     *
     * Two modes, driven by `sync_folders['INBOX']['backfill_done']`:
     *   1. Backfill: walk every INBOX message from newest to oldest, persisting
     *      the nextPageToken between page hops. last_synced_at is NOT touched.
     *   2. Incremental: fetch only mail newer than last_synced_at.
     *
     * Because we checkpoint the page token after every page, hitting the time
     * cap is no longer destructive — the next run picks up exactly where we
     * stopped and the historical tail is eventually fully imported.
     */
    protected function syncGmail(EmailAccount $account): int
    {
        // ShouldBeUnique on the job prevents duplicate queue jobs. We don't
        // add a cross-process lock here because the inbox AJAX loop should be
        // free to run in parallel — the message_id_header unique constraint
        // handles any page-overlap dedup. Serializing HTTP + queue on a single
        // lock was causing the browser loop to idle for 40+ seconds while the
        // worker held it.
        return $this->syncGmailLocked($account);
    }

    protected function syncGmailLocked(EmailAccount $account): int
    {
        // Acquire a row-level lock on the account to prevent concurrent sync jobs
        // from both refreshing the same OAuth token simultaneously, which could
        // cause one job to use a revoked token.
        $account = $this->refreshGmailTokenLocked($account, 15);

        $client = new GoogleClient();
        $client->setClientId(config('services.google.client_id'));
        $client->setClientSecret(config('services.google.client_secret'));
        $client->setAccessToken([
            'access_token' => $account->oauth_token,
            'refresh_token' => $account->oauth_refresh_token,
            'expires_in' => 3600,
        ]);
        // Set HTTP timeout so API calls don't hang forever on slow servers
        $client->setHttpClient(new \GuzzleHttp\Client([
            'timeout' => 30,
            'connect_timeout' => 10,
        ]));

        $gmail = new Gmail($client);
        $newCount = 0;
        $startTime = microtime(true);

        // Keep each run tight so the queue worker can cycle to other jobs
        // frequently. The backfill cursor means bailing early is cheap —
        // the next tick resumes from the saved page token. Stay ~10s under
        // the worker's own max-time so the worker never interrupts mid-save.
        $maxSeconds = 35;

        // Determine backfill state
        $folders = $this->normalizeSyncFolders($account->sync_folders ?? ['INBOX']);
        $inboxState = $folders['INBOX'] ?? ['backfill_done' => false];
        $isBackfilling = ! ($inboxState['backfill_done'] ?? false);

        Log::info("EmailSync: Gmail sync starting for {$account->email}", [
            'mode' => $isBackfilling ? 'backfill' : 'incremental',
            'last_synced' => $account->last_synced_at,
        ]);

        // Incremental filter — only mail newer than last successful full sync
        $query = '';
        if (! $isBackfilling && $account->last_synced_at) {
            $query = "after:{$account->last_synced_at->timestamp}";
        }

        // Resume from saved token during backfill
        $pageToken = $isBackfilling ? ($inboxState['backfill_page_token'] ?? null) : null;
        $stopped = false;

        do {
            // Time guard — stop before job timeout. We'll resume from $pageToken next run.
            if ((microtime(true) - $startTime) > $maxSeconds) {
                Log::info("EmailSync: Gmail time limit reached after {$newCount} messages, will continue next run");
                $stopped = true;
                break;
            }

            $params = [
                // With the batch API the per-page cost is dominated by one
                // list call + N×100-message batch gets, each batch ~1-3s. A
                // page of 250 completes in roughly 5-8s so we fit 4-6 pages
                // per 45s run → thousands of messages per cron minute.
                'maxResults' => 250,
                'labelIds' => ['INBOX'],
            ];
            if ($query) {
                $params['q'] = $query;
            }
            if ($pageToken) {
                $params['pageToken'] = $pageToken;
            }

            try {
                $messageList = $gmail->users_messages->listUsersMessages('me', $params);
            } catch (\Google\Service\Exception $e) {
                if (in_array($e->getCode(), [429, 500, 502, 503])) {
                    Log::warning("EmailSync: Gmail list API {$e->getCode()}, stopping for now");
                    $stopped = true;
                    break;
                }
                throw $e;
            }

            // Collect all message IDs on this page, then fetch them in a single
            // batch HTTP call (up to 100 messages per round-trip). This is the
            // core speedup — what used to take 50 × ~500ms sequential now takes
            // ~1-2 seconds total per page.
            $pageIds = [];
            foreach ($messageList->getMessages() ?? [] as $messageMeta) {
                $pageIds[] = $messageMeta->getId();
            }

            $pageCompleted = true;
            if (! empty($pageIds)) {
                // Time guard before the batch fetch
                if ((microtime(true) - $startTime) > $maxSeconds) {
                    $stopped = true;
                    $pageCompleted = false;
                } else {
                    $fullMessages = $this->gmailBatchGet($client, $gmail, $pageIds);

                    foreach ($pageIds as $id) {
                        if (! isset($fullMessages[$id])) continue;
                        try {
                            if ($this->processGmailMessage($fullMessages[$id], $account)) {
                                $newCount++;
                            }
                        } catch (\Throwable $e) {
                            Log::error("EmailSync: Gmail msg {$id}: " . Str::limit($e->getMessage(), 100));
                        }
                    }
                }
            }

            $nextPageToken = $messageList->getNextPageToken();

            // Only advance the saved cursor if we fully processed the current page.
            // If we bailed mid-page, leave the cursor alone — next run will re-list
            // this page and dedup (message_id_header unique check) will skip the
            // messages we already stored, then continue with the unprocessed tail.
            if ($isBackfilling && $pageCompleted && $nextPageToken) {
                $folders['INBOX']['backfill_page_token'] = $nextPageToken;
                $folders['INBOX']['backfill_done'] = false;
                $account->sync_folders = $folders;
                $account->save();
            }

            $pageToken = $nextPageToken;

            if ($stopped) break;
        } while ($pageToken);

        // Finalization — only mark the backfill done if the pagination fully
        // drained (no more nextPageToken AND we didn't bail on the time cap).
        if ($isBackfilling) {
            if (! $stopped && ! $pageToken) {
                $folders['INBOX']['backfill_done'] = true;
                unset($folders['INBOX']['backfill_page_token']);
                $account->sync_folders = $folders;
                $account->last_synced_at = now();
                $account->save();
                Log::info("EmailSync: Gmail BACKFILL COMPLETE for {$account->email}: {$newCount} new this run");
            } else {
                Log::info("EmailSync: Gmail backfill continuing for {$account->email}: {$newCount} new this run, more pending");
            }
        } else {
            // Pure incremental — safe to advance the anchor
            $account->update(['last_synced_at' => now()]);
            Log::info("EmailSync: Gmail incremental done for {$account->email}: {$newCount} new");
        }

        return $newCount;
    }

    /**
     * Fetch many Gmail messages in a SINGLE HTTP call using the batch endpoint.
     *
     * Collapses up to 100 messages.get calls into one request, which is the
     * single biggest lever for "flash" backfill speed — goes from ~500ms per
     * message (sequential) to ~5-20ms effective per message. Each batch still
     * consumes the individual quota units (5 per message), so we cap at 100.
     *
     * Returns map of [messageId => full Message object]. Failed sub-requests
     * are simply omitted (caller iterates what came back).
     */
    protected function gmailBatchGet(GoogleClient $client, Gmail $gmail, array $messageIds): array
    {
        if (empty($messageIds)) {
            return [];
        }

        $out = [];

        foreach (array_chunk($messageIds, 100) as $chunk) {
            // Up to 3 attempts per chunk on whole-batch 429/5xx (individual
            // sub-request errors are handled per-message below).
            $batchResults = null;
            for ($attempt = 0; $attempt <= 2; $attempt++) {
                $client->setUseBatch(true);
                try {
                    $batch = $gmail->createBatch();
                    foreach ($chunk as $id) {
                        // While useBatch=true these calls return a PSR-7 Request
                        // object instead of executing — we queue them all.
                        $req = $gmail->users_messages->get('me', $id, ['format' => 'full']);
                        $batch->add($req, 'm-' . $id);
                    }
                    $batchResults = $batch->execute();
                    break; // success
                } catch (\Google\Service\Exception $e) {
                    if (in_array($e->getCode(), [429, 500, 502, 503]) && $attempt < 2) {
                        $wait = pow(2, $attempt + 1);
                        Log::warning("EmailSync: Gmail batch {$e->getCode()}, retry in {$wait}s (attempt {$attempt})");
                        sleep($wait);
                        continue;
                    }
                    Log::error("EmailSync: Gmail batch failed: " . Str::limit($e->getMessage(), 150));
                    $batchResults = null;
                    break;
                } catch (\Throwable $e) {
                    Log::error("EmailSync: Gmail batch unexpected error: " . Str::limit($e->getMessage(), 150));
                    $batchResults = null;
                    break;
                } finally {
                    $client->setUseBatch(false);
                }
            }

            // Fallback: if the batch path failed for any reason (server blocks
            // multipart requests, batch endpoint unreachable, SDK quirk, etc.)
            // fetch each message individually. Slower but guarantees progress.
            if (! $batchResults) {
                Log::info("EmailSync: Gmail batch empty, falling back to sequential gets for " . count($chunk) . " messages");
                foreach ($chunk as $id) {
                    $full = $this->gmailGetWithRetry($gmail, $id);
                    if ($full) {
                        $out[$id] = $full;
                    }
                }
                continue;
            }

            // Build an index by stripping angle brackets + 'response-' prefix
            // from whatever Google returned as the key. Gmail sends the
            // Content-ID back as `<response-{original}>` per RFC 2392 so the
            // SDK's parsed key may or may not include the brackets depending
            // on the apiclient version.
            $byOriginalKey = [];
            foreach ($batchResults as $rawKey => $response) {
                $clean = trim($rawKey, '<>');
                if (str_starts_with($clean, 'response-')) {
                    $clean = substr($clean, strlen('response-'));
                }
                $byOriginalKey[$clean] = $response;
            }

            $missing = [];
            foreach ($chunk as $id) {
                $response = $byOriginalKey['m-' . $id] ?? null;
                if ($response && ! ($response instanceof \Exception)) {
                    $out[$id] = $response;
                } else {
                    $missing[] = $id;
                }
            }

            // Per-message fallback for any sub-responses that were errors or
            // missing — same reason: we'd rather be slow than silently skip.
            if (! empty($missing)) {
                Log::info("EmailSync: Gmail batch missed " . count($missing) . " messages, filling via sequential gets");
                foreach ($missing as $id) {
                    $full = $this->gmailGetWithRetry($gmail, $id);
                    if ($full) {
                        $out[$id] = $full;
                    }
                }
            }
        }

        return $out;
    }

    /**
     * Gmail API GET with automatic retry on 429 rate limit and 5xx server errors.
     * Retries up to 3 times with exponential backoff (2s, 4s, 8s).
     */
    protected function gmailGetWithRetry(Gmail $gmail, string $messageId, int $maxRetries = 3): ?object
    {
        for ($attempt = 0; $attempt <= $maxRetries; $attempt++) {
            try {
                return $gmail->users_messages->get('me', $messageId, ['format' => 'full']);
            } catch (\Google\Service\Exception $e) {
                $code = $e->getCode();
                if (in_array($code, [429, 500, 502, 503]) && $attempt < $maxRetries) {
                    $wait = pow(2, $attempt + 1); // 2s, 4s, 8s
                    Log::warning("EmailSync: Gmail API {$code} for {$messageId}, retry in {$wait}s (attempt {$attempt})");
                    sleep($wait);
                    continue;
                }
                Log::error("EmailSync: Gmail API failed for {$messageId} after retries: {$e->getMessage()}");
                return null;
            }
        }
        return null;
    }

    /**
     * Process a single Gmail API message.
     */
    protected function processGmailMessage(object $gmailMessage, EmailAccount $account): bool
    {
        $headers = collect($gmailMessage->getPayload()->getHeaders());

        $getHeader = fn (string $name) => $headers->firstWhere('name', $name)?->getValue();

        $messageIdHeader = $getHeader('Message-ID') ?? $getHeader('Message-Id');

        // Skip if already synced (scoped to workspace to prevent cross-workspace dedup)
        if ($messageIdHeader && Message::where('message_id_header', $messageIdHeader)
                ->where('workspace_id', $account->workspace_id)->exists()) {
            return false;
        }

        $fromRaw = $getHeader('From') ?? '';
        [$fromName, $fromAddress] = $this->parseEmailAddress($fromRaw);
        $subject = $getHeader('Subject') ?? '(No Subject)';
        $date = $getHeader('Date');
        $inReplyTo = $getHeader('In-Reply-To');
        $references = $getHeader('References');
        $referencesArray = $references ? preg_split('/\s+/', trim($references)) : [];

        $toRaw = $getHeader('To') ?? '';
        $ccRaw = $getHeader('Cc') ?? '';
        $bccRaw = $getHeader('Bcc') ?? '';

        $toAddresses = $this->parseMultipleAddresses($toRaw);
        $ccAddresses = $this->parseMultipleAddresses($ccRaw);
        $bccAddresses = $this->parseMultipleAddresses($bccRaw);

        // Parse body from MIME structure
        [$bodyHtml, $bodyText, $attachments] = $this->parseGmailPayload($gmailMessage->getPayload());

        $direction = strtolower($fromAddress) === strtolower($account->email) ? 'outbound' : 'inbound';

        $contact = $this->findOrCreateContact($account, $fromAddress, $fromName, $direction, $toAddresses);

        $conversation = $this->findOrCreateConversation($account, $contact, $subject, $messageIdHeader, $inReplyTo, $referencesArray);

        $sentAt = $date ? \Carbon\Carbon::parse($date) : now();

        // Also skip if Gmail message ID already exists (race condition guard)
        if (Message::where('channel_message_id', $gmailMessage->getId())
                ->where('workspace_id', $account->workspace_id)->exists()) {
            return false;
        }

        try {
            $message = Message::create([
                'conversation_id' => $conversation->id,
                'workspace_id' => $account->workspace_id,
                'uuid' => Str::uuid(),
                'direction' => $direction,
                'sender_type' => $direction === 'inbound' ? 'contact' : 'user',
                'sender_id' => $direction === 'outbound' ? $account->user_id : null,
                'type' => 'message',
                'body_html' => $bodyHtml ? Str::limit($bodyHtml, 15000000, '') : null,
                'body_text' => $bodyText ? Str::limit($bodyText, 15000000, '') : null,
                'subject' => $subject,
                'from_email' => $fromAddress,
                'from_name' => $fromName,
                'to_emails' => $toAddresses,
                'cc_emails' => $ccAddresses,
                'bcc_emails' => $bccAddresses,
                'message_id_header' => $messageIdHeader,
                'in_reply_to' => $inReplyTo,
                'references_header' => $referencesArray,
                'channel_message_id' => $gmailMessage->getId(),
                'delivery_status' => 'delivered',
                'sent_at' => $sentAt,
                'delivered_at' => $sentAt,
            ]);
        } catch (\Illuminate\Database\UniqueConstraintViolationException $e) {
            return false; // Already exists — skip silently
        }

        // Save Gmail attachments
        foreach ($attachments as $att) {
            $this->saveGmailAttachment($att, $message, $gmailMessage, $account);
        }

        // Use DB increment instead of count() query
        $conversation->update([
            'last_message_at' => $message->sent_at,
            'preview' => Str::limit($bodyText ?? strip_tags($bodyHtml ?? ''), 200),
            'is_read' => $direction === 'outbound',
        ]);
        $conversation->increment('messages_count');

        return true;
    }

    /**
     * Parse Gmail MIME payload recursively.
     *
     * @return array{0: ?string, 1: ?string, 2: array}
     */
    protected function parseGmailPayload(object $payload): array
    {
        $bodyHtml = null;
        $bodyText = null;
        $attachments = [];

        $mimeType = $payload->getMimeType();
        $body = $payload->getBody();

        if ($body && $body->getSize() > 0 && $body->getData()) {
            $decoded = $this->base64UrlDecode($body->getData());
            if ($mimeType === 'text/html') {
                $bodyHtml = $decoded;
            } elseif ($mimeType === 'text/plain') {
                $bodyText = $decoded;
            }
        }

        // Check for attachments
        if ($body && $body->getAttachmentId()) {
            $attachments[] = [
                'attachment_id' => $body->getAttachmentId(),
                'filename' => $payload->getFilename(),
                'mime_type' => $mimeType,
                'size' => $body->getSize(),
            ];
        }

        // Recurse into parts
        foreach ($payload->getParts() ?? [] as $part) {
            [$partHtml, $partText, $partAttachments] = $this->parseGmailPayload($part);
            $bodyHtml = $bodyHtml ?? $partHtml;
            $bodyText = $bodyText ?? $partText;
            $attachments = array_merge($attachments, $partAttachments);
        }

        return [$bodyHtml, $bodyText, $attachments];
    }

    /**
     * Save a Gmail attachment via the API.
     */
    protected function saveGmailAttachment(array $att, Message $message, object $gmailMessage, EmailAccount $account): void
    {
        try {
            $maxSize = 25 * 1024 * 1024; // 25 MB

            $client = new GoogleClient();
            $client->setClientId(config('services.google.client_id'));
            $client->setClientSecret(config('services.google.client_secret'));
            $client->setAccessToken(['access_token' => $account->oauth_token]);

            $gmail = new Gmail($client);

            // Retry attachment fetch on rate limit / server error
            $attachmentData = null;
            for ($retry = 0; $retry <= 3; $retry++) {
                try {
                    $attachmentData = $gmail->users_messages_attachments->get('me', $gmailMessage->getId(), $att['attachment_id']);
                    break;
                } catch (\Google\Service\Exception $e) {
                    if (in_array($e->getCode(), [429, 500, 502, 503]) && $retry < 3) {
                        sleep(pow(2, $retry + 1));
                        continue;
                    }
                    throw $e;
                }
            }
            if (!$attachmentData) return;

            $content = $this->base64UrlDecode($attachmentData->getData());

            // Only check the actual decoded content size. The pre-reported size
            // from the Gmail API metadata can differ from the real decoded bytes
            // (base64url overhead), so a single authoritative check avoids the
            // inconsistency of rejecting at one threshold but accepting at another.
            $contentSize = strlen($content);
            if ($contentSize > $maxSize) {
                Log::warning('EmailSync: Gmail attachment exceeds size limit, skipping', [
                    'message_id' => $message->id,
                    'filename' => $att['filename'] ?? 'unknown',
                    'size' => $contentSize,
                    'max' => $maxSize,
                ]);
                return;
            }

            $filename = $att['filename'] ?: ('attachment_' . Str::random(8));
            $storagePath = "attachments/{$account->workspace_id}/{$message->id}/{$filename}";

            Storage::put($storagePath, $content);

            Attachment::create([
                'message_id' => $message->id,
                'filename' => $filename,
                'original_filename' => $att['filename'],
                'mime_type' => $att['mime_type'],
                'size' => strlen($content),
                'storage_path' => $storagePath,
                'is_inline' => false,
            ]);
        } catch (\Throwable $e) {
            Log::error("EmailSync: Failed to save Gmail attachment: {$e->getMessage()}");
        }
    }

    /**
     * Sync via Microsoft Graph API.
     */
    protected function syncOutlook(EmailAccount $account): int
    {
        $newCount = 0;

        $accessToken = $account->oauth_token;

        // Build the filter for messages since last sync
        $filter = '';
        if ($account->last_synced_at) {
            $since = $account->last_synced_at->toIso8601String();
            $filter = "receivedDateTime gt {$since}";
        }

        $url = 'https://graph.microsoft.com/v1.0/me/mailFolders/inbox/messages';
        $params = [
            '$top' => 50,
            '$orderby' => 'receivedDateTime desc',
            '$select' => 'id,subject,from,toRecipients,ccRecipients,bccRecipients,body,bodyPreview,internetMessageId,internetMessageHeaders,receivedDateTime,hasAttachments,isRead',
        ];
        if ($filter) {
            $params['$filter'] = $filter;
        }

        $httpClient = new \GuzzleHttp\Client();

        do {
            // Retry on 429/5xx with exponential backoff
            $data = null;
            for ($retry = 0; $retry <= 3; $retry++) {
                try {
                    $response = $httpClient->get($url, [
                        'headers' => [
                            'Authorization' => "Bearer {$accessToken}",
                            'Accept' => 'application/json',
                            'Prefer' => 'outlook.body-content-type="html"',
                        ],
                        'query' => $params,
                    ]);
                    $data = json_decode($response->getBody()->getContents(), true);
                    break;
                } catch (\GuzzleHttp\Exception\ClientException $e) {
                    $code = $e->getResponse()->getStatusCode();
                    if (in_array($code, [429, 500, 502, 503]) && $retry < 3) {
                        $retryAfter = (int) ($e->getResponse()->getHeaderLine('Retry-After') ?: pow(2, $retry + 1));
                        Log::warning("EmailSync: Outlook API {$code}, retry in {$retryAfter}s");
                        sleep(min($retryAfter, 30));
                        continue;
                    }
                    throw $e;
                }
            }
            if (!$data) break;

            foreach ($data['value'] ?? [] as $graphMessage) {
                try {
                    $processed = $this->processOutlookMessage($graphMessage, $account, $httpClient, $accessToken);
                    if ($processed) {
                        $newCount++;
                    }
                } catch (\Throwable $e) {
                    Log::error("EmailSync: Failed to process Outlook message {$graphMessage['id']}: {$e->getMessage()}");
                }
            }

            // Handle pagination
            $url = $data['@odata.nextLink'] ?? null;
            $params = []; // nextLink already contains params
        } while ($url);

        return $newCount;
    }

    /**
     * Process a single Outlook/Graph message.
     */
    protected function processOutlookMessage(array $graphMessage, EmailAccount $account, \GuzzleHttp\Client $httpClient, string $accessToken): bool
    {
        $messageIdHeader = $graphMessage['internetMessageId'] ?? null;

        // Skip if already synced (scoped to workspace)
        if ($messageIdHeader && Message::where('message_id_header', $messageIdHeader)
                ->where('workspace_id', $account->workspace_id)->exists()) {
            return false;
        }

        $fromAddress = $graphMessage['from']['emailAddress']['address'] ?? '';
        $fromName = $graphMessage['from']['emailAddress']['name'] ?? $fromAddress;
        $subject = $graphMessage['subject'] ?? '(No Subject)';
        $date = isset($graphMessage['receivedDateTime']) ? \Carbon\Carbon::parse($graphMessage['receivedDateTime']) : now();

        $toAddresses = collect($graphMessage['toRecipients'] ?? [])->map(fn ($r) => $r['emailAddress']['address'])->toArray();
        $ccAddresses = collect($graphMessage['ccRecipients'] ?? [])->map(fn ($r) => $r['emailAddress']['address'])->toArray();
        $bccAddresses = collect($graphMessage['bccRecipients'] ?? [])->map(fn ($r) => $r['emailAddress']['address'])->toArray();

        // Extract In-Reply-To and References from internet message headers
        $inReplyTo = null;
        $referencesArray = [];
        foreach ($graphMessage['internetMessageHeaders'] ?? [] as $header) {
            if (strtolower($header['name']) === 'in-reply-to') {
                $inReplyTo = $header['value'];
            }
            if (strtolower($header['name']) === 'references') {
                $referencesArray = preg_split('/\s+/', trim($header['value']));
            }
        }

        $bodyHtml = $graphMessage['body']['content'] ?? null;
        $bodyText = $graphMessage['bodyPreview'] ?? null;

        $direction = strtolower($fromAddress) === strtolower($account->email) ? 'outbound' : 'inbound';

        $contact = $this->findOrCreateContact($account, $fromAddress, $fromName, $direction, $toAddresses);
        $conversation = $this->findOrCreateConversation($account, $contact, $subject, $messageIdHeader, $inReplyTo, $referencesArray);

        $message = Message::create([
            'conversation_id' => $conversation->id,
            'workspace_id' => $account->workspace_id,
            'uuid' => Str::uuid(),
            'direction' => $direction,
            'sender_type' => $direction === 'inbound' ? 'contact' : 'user',
            'sender_id' => $direction === 'outbound' ? $account->user_id : null,
            'type' => 'message',
            'body_html' => $bodyHtml ? Str::limit($bodyHtml, 15000000, '') : null,
            'body_text' => $bodyText ? Str::limit($bodyText, 15000000, '') : null,
            'subject' => $subject,
            'from_email' => $fromAddress,
            'from_name' => $fromName,
            'to_emails' => $toAddresses,
            'cc_emails' => $ccAddresses,
            'bcc_emails' => $bccAddresses,
            'message_id_header' => $messageIdHeader,
            'in_reply_to' => $inReplyTo,
            'references_header' => $referencesArray,
            'channel_message_id' => $graphMessage['id'],
            'delivery_status' => 'delivered',
            'sent_at' => $date,
            'delivered_at' => $date,
        ]);

        // Fetch and save attachments if present
        if ($graphMessage['hasAttachments'] ?? false) {
            $this->fetchOutlookAttachments($graphMessage['id'], $message, $account, $httpClient, $accessToken);
        }

        // Use DB increment instead of count() query
        $conversation->update([
            'last_message_at' => $message->sent_at,
            'preview' => Str::limit($bodyText ?? strip_tags($bodyHtml ?? ''), 200),
            'is_read' => $direction === 'outbound',
        ]);
        $conversation->increment('messages_count');

        return true;
    }

    /**
     * Fetch attachments for an Outlook message via Graph API.
     */
    protected function fetchOutlookAttachments(string $graphMessageId, Message $message, EmailAccount $account, \GuzzleHttp\Client $httpClient, string $accessToken): void
    {
        try {
            $response = $httpClient->get("https://graph.microsoft.com/v1.0/me/messages/{$graphMessageId}/attachments", [
                'headers' => [
                    'Authorization' => "Bearer {$accessToken}",
                    'Accept' => 'application/json',
                ],
            ]);

            $data = json_decode($response->getBody()->getContents(), true);

            foreach ($data['value'] ?? [] as $att) {
                if (($att['@odata.type'] ?? '') !== '#microsoft.graph.fileAttachment') {
                    continue;
                }

                $content = base64_decode($att['contentBytes'] ?? '');
                $filename = $att['name'] ?? ('attachment_' . Str::random(8));
                $storagePath = "attachments/{$account->workspace_id}/{$message->id}/{$filename}";

                Storage::put($storagePath, $content);

                Attachment::create([
                    'message_id' => $message->id,
                    'filename' => $filename,
                    'original_filename' => $att['name'] ?? $filename,
                    'mime_type' => $att['contentType'] ?? 'application/octet-stream',
                    'size' => $att['size'] ?? strlen($content),
                    'storage_path' => $storagePath,
                    'is_inline' => $att['isInline'] ?? false,
                    'content_id' => $att['contentId'] ?? null,
                ]);
            }
        } catch (\Throwable $e) {
            Log::error("EmailSync: Failed to fetch Outlook attachments for message {$graphMessageId}: {$e->getMessage()}");
        }
    }

    /**
     * Find or create a conversation using threading logic.
     * Matches by: In-Reply-To, References, or subject + contact.
     */
    protected function findOrCreateConversation(
        EmailAccount $account,
        ?Contact $contact,
        string $subject,
        ?string $messageId,
        ?string $inReplyTo,
        array $references
    ): Conversation {
        // 1. Try to match by In-Reply-To header
        if ($inReplyTo) {
            $existing = Message::where('message_id_header', $inReplyTo)
                ->whereHas('conversation', fn ($q) => $q->where('workspace_id', $account->workspace_id))
                ->first();
            if ($existing) {
                return $existing->conversation;
            }
        }

        // 2. Try to match by References headers
        if (! empty($references)) {
            $existing = Message::whereIn('message_id_header', $references)
                ->whereHas('conversation', fn ($q) => $q->where('workspace_id', $account->workspace_id))
                ->first();
            if ($existing) {
                return $existing->conversation;
            }
        }

        // 3. Try to match by subject + contact (strip Re: / Fwd: prefixes)
        $cleanSubject = preg_replace('/^(Re|Fwd|Fw):\s*/i', '', $subject);
        if ($contact) {
            $existing = Conversation::where('workspace_id', $account->workspace_id)
                ->where('contact_id', $contact->id)
                ->where('email_account_id', $account->id)
                ->where('subject', 'like', '%' . $cleanSubject . '%')
                ->where('last_message_at', '>=', now()->subDays(30))
                ->orderBy('last_message_at', 'desc')
                ->first();
            if ($existing) {
                return $existing;
            }
        }

        // 4. Create new conversation
        return Conversation::create([
            'workspace_id' => $account->workspace_id,
            'contact_id' => $contact?->id,
            'email_account_id' => $account->id,
            'channel' => 'email',
            'status' => 'open',
            'priority' => 'normal',
            'subject' => $subject,
            'is_read' => false,
            'is_starred' => false,
            'is_pinned' => false,
            'messages_count' => 0,
            'last_message_at' => now(),
        ]);
    }

    /**
     * True for machine-generated senders (no-reply, mailer-daemon, notifications …). They are conversations,
     * not people, so they must not clutter the contact list.
     */
    protected function isAutomatedSender(string $email): bool
    {
        $email = strtolower(trim($email));
        $local = strstr($email, '@', true);
        $local = $local === false ? $email : $local;

        return (bool) preg_match('/^(no[-_.]?reply|do[-_.]?not[-_.]?reply|mailer-daemon|postmaster|bounces?|notifications?|newsletter|auto[-_.]?reply|automated)([-_.+].*)?$/', $local);
    }

    /**
     * Find or create a contact from email address.
     */
    protected function findOrCreateContact(EmailAccount $account, string $email, string $name, string $direction, array $toAddresses = []): ?Contact
    {
        // For outbound, the contact is the recipient
        $contactEmail = $direction === 'outbound' ? ($toAddresses[0] ?? $email) : $email;
        $contactName = $direction === 'outbound' ? $contactEmail : $name;

        if (! $contactEmail || strtolower($contactEmail) === strtolower($account->email)) {
            return null;
        }

        $contact = Contact::where('workspace_id', $account->workspace_id)
            ->where('email', $contactEmail)
            ->first();

        if (! $contact) {
            // Settings → Contacts → "Auto-create contacts" was previously ignored here.
            $workspace = \App\Models\Workspace::find($account->workspace_id);
            $settings = is_array($workspace?->settings) ? $workspace->settings : [];
            if (! filter_var($settings['contact_auto_create'] ?? true, FILTER_VALIDATE_BOOLEAN)) {
                return null;
            }

            // Automated / system senders (e.g. noreply@dahimail.com welcome mail) are not contacts.
            if ($direction !== 'outbound' && $this->isAutomatedSender($contactEmail)) {
                return null;
            }

            $nameParts = explode(' ', $contactName, 2);
            $contact = Contact::create([
                'workspace_id' => $account->workspace_id,
                'email' => $contactEmail,
                'first_name' => $nameParts[0] ?? $contactEmail,
                'last_name' => $nameParts[1] ?? null,
                'status' => 'active',
                'last_contacted_at' => now(),
            ]);
        } else {
            $contact->update(['last_contacted_at' => now()]);
        }

        return $contact;
    }

    /**
     * Save IMAP attachment to storage.
     */
    protected function saveAttachment(object $attachment, Message $message): void
    {
        try {
            $maxSize = 25 * 1024 * 1024; // 25 MB

            $filename = $attachment->getName() ?: ('attachment_' . Str::random(8));
            $mimeType = $attachment->getMimeType() ?: 'application/octet-stream';
            $content = $attachment->getContent();

            // Only check the actual decoded content size. The reported size from
            // IMAP headers can differ from the real content (base64 inflation,
            // transfer encoding, etc.), so checking both causes inconsistency.
            $contentSize = strlen($content);
            if ($contentSize > $maxSize) {
                Log::warning('EmailSync: Attachment exceeds size limit, skipping', [
                    'message_id' => $message->id,
                    'filename' => $filename,
                    'size' => $contentSize,
                    'max' => $maxSize,
                ]);
                return;
            }

            $storagePath = "attachments/{$message->workspace_id}/{$message->id}/{$filename}";
            Storage::put($storagePath, $content);

            Attachment::create([
                'message_id' => $message->id,
                'filename' => $filename,
                'original_filename' => $filename,
                'mime_type' => $mimeType,
                'size' => strlen($content),
                'storage_path' => $storagePath,
                'is_inline' => false,
                'content_id' => $attachment->getContentId() ?? null,
            ]);
        } catch (\Throwable $e) {
            Log::error("EmailSync: Failed to save IMAP attachment: {$e->getMessage()}");
        }
    }

    /**
     * Parse "Name <email@example.com>" format.
     *
     * @return array{0: string, 1: string}
     */
    protected function parseEmailAddress(string $raw): array
    {
        $raw = trim($raw);
        if (preg_match('/^"?(.+?)"?\s*<(.+?)>$/', $raw, $matches)) {
            return [trim($matches[1], '" '), trim($matches[2])];
        }
        return [$raw, $raw];
    }

    /**
     * Parse multiple comma-separated email addresses.
     */
    protected function parseMultipleAddresses(string $raw): array
    {
        if (empty(trim($raw))) {
            return [];
        }

        $addresses = [];
        // Split by comma but respect quoted strings
        $parts = preg_split('/,(?=(?:[^"]*"[^"]*")*[^"]*$)/', $raw);

        foreach ($parts as $part) {
            $part = trim($part);
            if (preg_match('/<(.+?)>/', $part, $matches)) {
                $addresses[] = trim($matches[1]);
            } elseif (filter_var($part, FILTER_VALIDATE_EMAIL)) {
                $addresses[] = $part;
            }
        }

        return $addresses;
    }

    /**
     * Decode base64url encoded data (Gmail API format).
     */
    protected function base64UrlDecode(string $data): string
    {
        return base64_decode(strtr($data, '-_', '+/'));
    }

    /**
     * Normalize sync_folders from either legacy or current format into
     * an associative array keyed by folder name with metadata.
     *
     * Legacy format:  ['INBOX', 'Sent']
     * Current format: {'INBOX': {'last_uid': 5}, 'Sent': {'last_uid': 12}}
     *
     * @return array<string, array{last_uid: int|null}>
     */
    protected function normalizeSyncFolders(array $folders): array
    {
        $normalized = [];

        foreach ($folders as $key => $value) {
            if (is_int($key) && is_string($value)) {
                // Legacy format: numeric key, string value (folder name)
                $normalized[$value] = ['last_uid' => null];
            } elseif (is_string($key) && is_array($value)) {
                // Current format: folder name as key, metadata as value
                $normalized[$key] = $value;
            }
        }

        return $normalized ?: ['INBOX' => ['last_uid' => null]];
    }
}
