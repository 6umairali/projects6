<?php

namespace App\Services\Friends;

use App\Models\User;
use Carbon\Carbon;
use Illuminate\Support\Facades\DB;

/**
 * "People": everyone you can talk to inside the platform – friends and the members of your workspace – and their profiles.
 * A profile can be opened only for a friend or a teammate.
 */
class PeopleService
{
    public function __construct(private readonly FriendService $friends, private readonly FriendChatService $chat, private readonly PresenceService $presence) {}

    private function avatar($u): ?string
    {
        return $u->avatar_path ? asset('storage/' . $u->avatar_path) : null;
    }

    /** members of YOUR active workspace (not you) */
    public function team(User $u): array
    {
        if (!$u->active_workspace_id) return [];
        $friendIds = DB::table('friend_requests')->where('status', 'accepted')
            ->where(fn ($q) => $q->where('requester_id', $u->id)->orWhere('addressee_id', $u->id))
            ->get(['requester_id', 'addressee_id'])->map(fn ($r) => (int) ($r->requester_id === $u->id ? $r->addressee_id : $r->requester_id))->all();
        $unread = $this->chat->unreadCounts($u);
        return DB::table('workspace_members as m')->join('users as x', 'x.id', '=', 'm.user_id')
            ->where('m.workspace_id', $u->active_workspace_id)->where('m.user_id', '!=', $u->id)->where('x.status', 'active')
            ->orderBy('x.name')->get(['x.id', 'x.uuid', 'x.name', 'x.username', 'x.email', 'x.avatar_path', 'm.role', 'm.status as presence', 'm.last_active_at'])
            ->map(fn ($r) => [
                'id' => (int) $r->id, 'name' => $r->name, 'username' => \App\Support\Username::plain($r->username), 'chat_url' => (new User)->newFromBuilder((array) $r)->chatUrl(), 'email' => $r->email, 'avatar_url' => $this->avatar($r),
                'role' => $r->role, 'presence' => $r->presence, 'last_active' => $r->last_active_at ? Carbon::parse($r->last_active_at)->diffForHumans() : null,
                'is_friend' => in_array((int) $r->id, $friendIds, true), 'can_talk' => true, 'unread' => $unread[(int) $r->id] ?? 0,
            ])->all();
    }

    /** friends + requests + suggestions (the existing overview) plus the team */
    public function directory(User $u): array
    {
        $d = $this->friends->overview($u) + ['team' => $this->team($u)];
        $ids = [];
        foreach (['friends', 'team'] as $k) foreach (($d[$k] ?? []) as $p) $ids[] = (int) $p['id'];
        $pr = $this->presence->forViewer($u, $ids);
        $previews = $this->chat->previews($u, $ids);
        $calls = [];
        foreach (DB::table('friend_calls')->where(fn ($w) => $w->where('caller_id', $u->id)->orWhere('callee_id', $u->id))
            ->where(fn ($w) => $w->where('status', 'active')->orWhere(fn ($x) => $x->where('status', 'ringing')->where('created_at', '>', now()->subSeconds(FriendCallService::RING_SECONDS))))->get() as $call) {
            $calls[(int) ($call->caller_id == $u->id ? $call->callee_id : $call->caller_id)] = $call->status;
        }
        foreach (['friends', 'team'] as $k) {
            foreach (($d[$k] ?? []) as $i => $p) { $x = $pr[(int) $p['id']] ?? ['online' => false, 'label' => null]; $d[$k][$i]['call_status'] = $calls[(int) $p['id']] ?? null; $d[$k][$i]['preview'] = $previews[(int) $p['id']] ?? null; $d[$k][$i]['online'] = $x['online']; $d[$k][$i]['status_label'] = $x['label']; }
        }
        $d['my_presence'] = $this->presence->enabled($u->id);
        return $d;
    }

    /** @return array<string,mixed> profile of a friend or teammate (404 for anybody else) */
    public function profile(User $me, int $id): array
    {
        abort_if($id === $me->id, 404);
        $x = User::where('status', 'active')->find($id);
        abort_unless($x, 404);

        $friendRow = DB::table('friend_requests')->where('status', 'accepted')
            ->where(fn ($q) => $q->where(fn ($w) => $w->where('requester_id', $me->id)->where('addressee_id', $id))->orWhere(fn ($w) => $w->where('requester_id', $id)->where('addressee_id', $me->id)))->first();
        $teamRow = DB::table('workspace_members as a')->join('workspace_members as b', 'a.workspace_id', '=', 'b.workspace_id')
            ->where('a.user_id', $me->id)->where('b.user_id', $id)->orderByRaw('b.workspace_id = ? desc', [$me->active_workspace_id ?? 0])
            ->first(['b.role', 'b.status as presence', 'b.last_active_at']);
        $formerRow = DB::table('friend_requests')->where('status', 'unfriended')
            ->where(fn ($q) => $q->where(fn ($w) => $w->where('requester_id', $me->id)->where('addressee_id', $id))->orWhere(fn ($w) => $w->where('requester_id', $id)->where('addressee_id', $me->id)))->first();
        abort_unless($friendRow || $teamRow || $formerRow, 404);

        $tz = $x->timezone ?: 'UTC';
        try { $local = Carbon::now($tz)->format('H:i'); } catch (\Throwable $e) { $local = null; $tz = null; }
        $p = [
            'id' => $x->id, 'name' => $x->name, 'username' => \App\Support\Username::plain($x->username), 'chat_url' => $x->chatUrl(), 'email' => $x->email, 'avatar_url' => $this->avatar($x),
            'member_since' => $x->created_at?->format('F Y'),
            'timezone' => $tz, 'local_time' => $local, 'language' => $x->language ?: $x->locale,
            'can_talk' => (bool) ($friendRow || $teamRow), 'is_friend' => (bool) $friendRow, 'is_former' => (bool) ($formerRow && !$friendRow),
            'friend_since' => (($friendRow ?: $formerRow)?->responded_at) ? Carbon::parse(($friendRow ?: $formerRow)->responded_at)->format('M j, Y') : null,
            'unfriended_on' => ($formerRow && !$friendRow && $formerRow->unfriended_at) ? Carbon::parse($formerRow->unfriended_at)->format('M j, Y') : null,
            'unfriended_by_me' => ($formerRow && !$friendRow) ? ((int) $formerRow->unfriended_by === $me->id) : null,
            'history' => $this->friends->history($me, $x->id),            // requested / became friends / unfriended – with dates
            'is_team' => (bool) $teamRow,
            'team' => $teamRow ? ['role' => $teamRow->role, 'presence' => $teamRow->presence, 'last_active' => $teamRow->last_active_at ? Carbon::parse($teamRow->last_active_at)->diffForHumans() : null] : null,
            'unread' => $this->chat->unreadCounts($me)[$x->id] ?? 0,
        ];
        $x2 = $this->presence->forViewer($me, [$x->id])[$x->id] ?? ['online' => false, 'label' => null];
        $p['online'] = $x2['online']; $p['status_label'] = $x2['label'];
        return $p;
    }
}
