<?php

namespace App\Services\Friends;

use App\Models\User;
use App\Support\FriendSettings;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\RateLimiter;

/**
 * One-to-one AUDIO calls between friends (WebRTC). The audio goes directly between the two devices (or through a TURN relay);
 * this service only carries the "signalling" (offer / answer / network candidates) and keeps the call state.
 * Both the website and the app use the same endpoints, so they can call each other.
 */
class FriendCallService
{
    public const RING_SECONDS = 45;

    public function __construct(private readonly FriendChatService $chat, private readonly \App\Services\Meetings\MeetingService $meetings) {}

    private function peer(int $id): array
    {
        $u = User::find($id);
        return ['id' => $id, 'chat_url' => $u?->chatUrl() ?? url('/people'), 'name' => $u?->name ?? 'Friend', 'avatar_url' => ($u && $u->avatar_path) ? asset('storage/' . $u->avatar_path) : null];
    }

    private function shape(object $c, int $meId): array
    {
        $caller = (int) $c->caller_id === $meId;
        return [
            'id' => (int) $c->id,
            'status' => $c->status,
            'sent_at' => \Carbon\Carbon::parse($c->created_at, 'UTC')->timestamp,
            'ttl' => self::RING_SECONDS,
            'group' => (bool) ($c->group_invite ?? 0),
            'audio_only' => (bool) ($c->audio_only ?? 0),
            'role' => $caller ? 'caller' : 'callee',
            'peer' => $this->peer($caller ? (int) $c->callee_id : (int) $c->caller_id),
            'ice_servers' => FriendSettings::iceServers(),
            'video' => (bool) ($c->video ?? false),
            'meeting' => $c->meeting_code ?? null, // a video call is a private 2-person meeting: both join this room
            'recording_active' => app(\App\Services\Recording\RecordingService::class)->isActiveForCode($c->meeting_code ?? null), // a recording runs right now
            'recording' => FriendSettings::callRecordingEnabled(), // true → both phones show "this call is recorded" and the app uploads the recording
        ];
    }

    private function log(object $c, string $text): void
    {
        $mid = DB::table('friend_messages')->insertGetId(['sender_id' => $c->caller_id, 'recipient_id' => $c->callee_id, 'body' => $text, 'kind' => 'call', 'call_id' => $c->id, 'created_at' => now(), 'updated_at' => now()]);
    }

    private function duration(object $c): string
    {
        if (!$c->answered_at) return '';
        $s = max(0, now()->getTimestamp() - \Carbon\Carbon::parse($c->answered_at)->getTimestamp()); // plain subtraction: no sign surprises
        return sprintf('%02d:%02d', intdiv($s, 60), $s % 60);
    }

    /** rings that nobody answered become "missed"; calls stuck open for hours are closed */
    private function expire(): void
    {
        foreach (DB::table('friend_calls')->where('status', 'ringing')->where('created_at', '<', now()->subSeconds(self::RING_SECONDS))->get() as $c) {
            $n = DB::table('friend_calls')->where('id', $c->id)->where('status', 'ringing')->update(['status' => 'missed', 'ended_at' => now(), 'updated_at' => now()]);
            if (!$n) continue;                                              // somebody answered in the same second
            $this->log($c, ($c->video ?? false) && !($c->audio_only ?? false) ? 'Missed video call' : 'Missed audio call');
            FriendPush::stopRinging($c, 'missed');                          // the ringing stops on every phone …
            FriendPush::missedCall($c);                                     // … and a "Missed call" notification stays
            if (($c->meeting_code ?? null) && !($c->group_invite ?? 0)) $this->meetings->endByCode($c->meeting_code); // a declined ADD-TO-CALL invite never closes the room
        }
        try {
        // video calls whose room nobody is in any more are closed (so the person is not "busy" for hours)
        DB::table('friend_calls')->where('status', 'active')->where('video', 1)->whereNotNull('meeting_code')->where('updated_at', '<', now()->subMinutes(2))
            ->whereRaw("NOT EXISTS (SELECT 1 FROM meeting_participants p JOIN meetings m ON m.id = p.meeting_id WHERE m.code = friend_calls.meeting_code AND p.status = 'joined' AND p.user_id IN (friend_calls.caller_id, friend_calls.callee_id))")
            ->update(['status' => 'ended', 'ended_at' => now(), 'updated_at' => now()]);
        } catch (\Throwable $e) { \Illuminate\Support\Facades\Log::warning('call cleanup skipped: ' . $e->getMessage()); } // housekeeping must never block a call
        DB::table('friend_calls')->where('status', 'active')->where('updated_at', '<', now()->subHours(3))->update(['status' => 'ended', 'ended_at' => now(), 'updated_at' => now()]);
        if (random_int(1, 50) === 1) DB::table('friend_call_signals')->where('created_at', '<', now()->subDay())->delete();
    }

    /** called every minute by the scheduler: a ring nobody answered becomes "missed" even if no phone is polling any more */
    public function sweep(): void
    {
        $this->expire();
    }

    private function busy(int $userId): bool
    {
        return DB::table('friend_calls')->whereIn('status', ['ringing', 'active'])->where(fn ($q) => $q->where('caller_id', $userId)->orWhere('callee_id', $userId))->exists();
    }

    private function mine(User $me, int $callId): ?object
    {
        $c = DB::table('friend_calls')->find($callId);
        return ($c && in_array($me->id, [(int) $c->caller_id, (int) $c->callee_id], true)) ? $c : null;
    }

    /** @return array{0:bool,1:string,2:?array} */
    public function start(User $me, int $calleeId, bool $video = false, bool $audioOnly = false): array
    {
        if (!FriendSettings::callsEnabled()) return [false, 'Calls are switched off.', null];
        $this->chat->friendOrFail($me, $calleeId);
        $this->expire();
        if ($this->busy($me->id)) return [false, 'You are already in a call.', null];
        if ($this->busy($calleeId)) return [false, 'Your friend is on another call.', null];
        $limiter = "friend-call:{$me->id}";
        if (RateLimiter::tooManyAttempts($limiter, 30)) return [false, 'Too many calls. Try again later.', null];
        RateLimiter::hit($limiter, 3600);
        $row = ['caller_id' => $me->id, 'callee_id' => $calleeId, 'status' => 'ringing', 'created_at' => now(), 'updated_at' => now()];
        if ($video) {
            if (!$this->meetings->enabled()) return [false, 'Video calls are switched off.', null];
            $row += ['video' => 1, 'audio_only' => $audioOnly ? 1 : 0, 'meeting_code' => $this->meetings->startCall($me, $calleeId, $audioOnly)->code];
        }
        $id = DB::table('friend_calls')->insertGetId($row);
        $fresh = DB::table('friend_calls')->find($id);
        FriendPush::incomingCall($fresh);                                   // the friend's phone rings, also when the app is closed
        return [true, 'Calling…', $this->shape($fresh, $me->id)];
    }

    /** Add another friend to a call / meeting you are in: their phone or browser rings; Accept puts them in the same room. */
    public function inviteToMeeting(User $me, string $code, int $friendId): array
    {
        if (!FriendSettings::callsEnabled() || !$this->meetings->enabled()) return [false, 'Video calls are switched off.'];
        $this->chat->friendOrFail($me, $friendId);
        $m = $this->meetings->find($code);
        if (!$m || in_array($m->status, ['ended', 'cancelled'], true)) return [false, 'This call has ended.'];
        $inside = DB::table('meeting_participants')->where('meeting_id', $m->id)->where('user_id', $me->id)->where('status', 'joined')->exists();
        if (!$inside) return [false, 'Join the call first.'];
        if (DB::table('meeting_participants')->where('meeting_id', $m->id)->where('user_id', $friendId)->where('status', 'joined')->exists()) return [false, 'They are already in the call.'];
        $this->expire();
        if ($this->busy($friendId)) return [false, 'They are on another call.'];
        if (DB::table('friend_calls')->where('status', 'ringing')->where('callee_id', $friendId)->where('meeting_code', $m->code)->exists()) return [false, 'They are already being called.'];
        if (DB::table('meeting_participants')->where('meeting_id', $m->id)->where('status', 'joined')->count() >= $this->meetings->max()) return [false, 'The call is full.'];
        $limiter = "friend-invite:{$me->id}";
        if (RateLimiter::tooManyAttempts($limiter, 40)) return [false, 'Too many invitations. Try again later.'];
        RateLimiter::hit($limiter, 3600);
        $this->meetings->addInvitee($m->id, $friendId);
        $audioOnly = (bool) ($this->callRow($m->code)->audio_only ?? 0); // an audio room stays an audio call for the new person too
        $gid = DB::table('friend_calls')->insertGetId(['caller_id' => $me->id, 'callee_id' => $friendId, 'status' => 'ringing', 'video' => 1, 'audio_only' => $audioOnly ? 1 : 0, 'meeting_code' => $m->code, 'group_invite' => 1, 'created_at' => now(), 'updated_at' => now()]);
        FriendPush::incomingCall(DB::table('friend_calls')->find($gid));
        return [true, 'Calling…'];
    }

    private function callRow(string $code): ?object
    {
        return DB::table('friend_calls')->where('meeting_code', $code)->where('group_invite', 0)->orderBy('id')->first();
    }

    /** Call log, newest first: who, in / out, video or audio, how long, missed or declined. */
    public function history(User $me, int $limit = 60): array
    {
        $cut = 0;
        try { $cut = (int) DB::table('friend_call_clears')->where('user_id', $me->id)->value('before_id'); } catch (\Throwable $e) {}
        $rows = DB::table('friend_calls')->where('id', '>', $cut)->where(fn ($q) => $q->where('caller_id', $me->id)->orWhere('callee_id', $me->id))
            ->whereIn('status', ['active', 'ended', 'missed', 'declined', 'cancelled'])->orderByDesc('id')->limit($limit)->get();
        $tz = $me->timezone ?: config('app.timezone', 'UTC');
        $rec = [];                                                          // call id → chat line that carries the recording
        try { $rec = DB::table('friend_messages')->whereIn('call_id', $rows->pluck('id')->all())->whereNotNull('file_path')->pluck('id', 'call_id')->all(); } catch (\Throwable $e) {}
        $out = [];
        foreach ($rows as $c) {
            $out_ = (int) $c->caller_id === $me->id;
            $peerId = $out_ ? (int) $c->callee_id : (int) $c->caller_id;
            $secs = ($c->answered_at && $c->ended_at) ? max(0, \Carbon\Carbon::parse($c->ended_at)->getTimestamp() - \Carbon\Carbon::parse($c->answered_at)->getTimestamp()) : 0;
            $t = \Carbon\Carbon::parse($c->created_at, 'UTC')->setTimezone($tz);
            $outcome = $c->answered_at ? 'answered' : ($c->status === 'declined' ? 'declined' : 'missed');
            $out[] = ['id' => (int) $c->id, 'peer' => $this->peer($peerId), 'outgoing' => $out_, 'video' => (bool) ($c->video ?? 0) && !($c->audio_only ?? 0),
                'outcome' => $outcome, 'recording_message_id' => isset($rec[(int) $c->id]) ? (int) $rec[(int) $c->id] : null, 'duration' => $secs, 'duration_text' => $secs > 0 ? sprintf('%d:%02d', intdiv($secs, 60), $secs % 60) : '',
                'when' => $t->isToday() ? $t->format('H:i') : ($t->isYesterday() ? 'Yesterday ' . $t->format('H:i') : $t->format('M j, H:i')), 'at' => $t->toIso8601String()];
        }
        return $out;
    }

    /** Empty the call list for this person (the other person's list is not touched). */
    public function clearHistory(User $me): void
    {
        $max = (int) DB::table('friend_calls')->where(fn ($q) => $q->where('caller_id', $me->id)->orWhere('callee_id', $me->id))->max('id');
        if ($max > 0) DB::table('friend_call_clears')->updateOrInsert(['user_id' => $me->id], ['before_id' => $max]);
    }

    /** What the person should know right now: an incoming ring and / or the call they are in. */
    public function poll(User $me): array
    {
        $messages = FriendSettings::chatEnabled() ? $this->chat->liveSummary($me) : ['unread' => 0, 'latest' => null];
        if (!FriendSettings::callsEnabled()) return ['incoming' => null, 'current' => null, 'messages' => $messages];
        $this->expire();
        $in = DB::table('friend_calls')->where('callee_id', $me->id)->where('status', 'ringing')->orderByDesc('id')->first();
        $cur = DB::table('friend_calls')->whereIn('status', ['ringing', 'active'])->where(fn ($q) => $q->where('caller_id', $me->id)->orWhere('callee_id', $me->id))->orderByDesc('id')->first();
        return ['incoming' => $in ? $this->shape($in, $me->id) : null, 'current' => $cur ? $this->shape($cur, $me->id) : null, 'messages' => $messages];
    }

    /** @return array{0:bool,1:string} */
    public function signal(User $me, int $callId, string $type, string $payload): array
    {
        $c = $this->mine($me, $callId);
        if (!$c || !in_array($c->status, ['ringing', 'active'], true)) return [false, 'The call is over.'];
        if (!in_array($type, ['offer', 'answer', 'ice'], true) || strlen($payload) > 30000) return [false, 'Invalid signal.'];
        $id = DB::table('friend_call_signals')->insertGetId(['call_id' => $callId, 'from_user_id' => $me->id, 'type' => $type, 'payload' => $payload, 'created_at' => now()]);
        $recipient = (int) $c->caller_id === $me->id ? $c->callee_id : $c->caller_id;
        \App\Services\RealtimeUpdates::users([$recipient], ['type' => 'call_signal', 'call_id' => $callId,
            'signal' => ['id' => $id, 'type' => $type, 'payload' => $payload]]);
        return [true, 'ok'];
    }

    /** The other side's signals after $after, plus the current status (so both sides notice the end). */
    public function signals(User $me, int $callId, int $after): ?array
    {
        $c = $this->mine($me, $callId);
        if (!$c) return null;
        if ($c->status === 'ringing') { $this->expire(); $c = DB::table('friend_calls')->find($callId); }
        $rows = DB::table('friend_call_signals')->where('call_id', $callId)->where('from_user_id', '!=', $me->id)->where('id', '>', $after)->orderBy('id')->limit(100)->get();
        return ['status' => $c->status, 'signals' => $rows->map(fn ($r) => ['id' => (int) $r->id, 'type' => $r->type, 'payload' => $r->payload])->all()];
    }

    /** @return array{0:bool,1:string} */
    public function answer(User $me, int $callId): array
    {
        $this->expire();
        $c = $this->mine($me, $callId);
        if (!$c || (int) $c->callee_id !== $me->id || $c->status !== 'ringing') return [false, 'This call is no longer available.'];
        if (!DB::table('friend_calls')->where('id', $callId)->where('status', 'ringing')->update(['status' => 'active', 'answered_at' => now(), 'updated_at' => now()])) return [false, 'This call is no longer available.'];
        FriendPush::stopRinging($c, 'answered');                            // other phones / browsers of the same person stop ringing
        return [true, 'Connected.'];
    }

    /** @return array{0:bool,1:string} */
    public function decline(User $me, int $callId): array
    {
        return DB::transaction(function () use ($me, $callId) {
            $this->expire();
            $c = $this->mine($me, $callId);
            if (!$c || (int) $c->callee_id !== $me->id || $c->status !== 'ringing') return [false, 'This call is no longer available.'];
            if (!DB::table('friend_calls')->where('id', $callId)->where('status', 'ringing')->update(['status' => 'declined', 'ended_at' => now(), 'updated_at' => now()])) return [false, 'This call is no longer available.'];
            $this->log($c, 'Declined call');
            DB::afterCommit(fn () => FriendPush::stopRinging($c, 'declined'));
            if ($c->meeting_code ?? null) {
                $room = $this->meetings->find($c->meeting_code);
                if ($room && $room->kind === 'call') $this->meetings->endByCode($c->meeting_code);
            }
            return [true, 'Declined.'];
        });
    }

    /** @return array{0:bool,1:string} */
    public function end(User $me, int $callId): array
    {
        return DB::transaction(function () use ($me, $callId) {
            $c = $this->mine($me, $callId);
            if (!$c) return [false, 'Not found.'];
            if ($c->status === 'ringing') {
                if (!DB::table('friend_calls')->where('id', $callId)->where('status', 'ringing')->update(['status' => 'cancelled', 'ended_at' => now(), 'updated_at' => now()])) return [true, 'Call ended.'];
                $this->log($c, ($c->video ?? false) && !($c->audio_only ?? false) ? 'Missed video call' : 'Missed audio call');
                DB::afterCommit(fn () => FriendPush::stopRinging($c, 'cancelled'));                      // the caller hung up: the ringing stops on the friend's phone
                DB::afterCommit(fn () => FriendPush::missedCall($c));
                if (($c->meeting_code ?? null) && !($c->group_invite ?? 0)) $this->meetings->endByCode($c->meeting_code); // a declined ADD-TO-CALL invite never closes the room
            } elseif ($c->status === 'active') {
                if (!DB::table('friend_calls')->where('id', $callId)->where('status', 'active')->update(['status' => 'ended', 'ended_at' => now(), 'updated_at' => now()])) return [true, 'Call ended.'];
                $this->log($c, 'Call · ' . $this->duration($c));
                if ($c->meeting_code ?? null) {
                    $room = $this->meetings->find($c->meeting_code);
                    if ($room && $room->kind === 'call') $this->meetings->endByCode($c->meeting_code);
                }
                DB::afterCommit(fn () => FriendPush::stopRinging($c, 'ended'));
            }
            return [true, 'Call ended.'];
        });
    }
}
