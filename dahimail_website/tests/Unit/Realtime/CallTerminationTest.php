<?php

use App\Events\StateChanged;
use App\Models\User;
use App\Services\Friends\FriendCallService;
use App\Services\Meetings\MeetingService;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Event;

beforeEach(function () {
    config(['database.default' => 'sqlite', 'database.connections.sqlite.database' => ':memory:', 'broadcasting.default' => 'log']);
    DB::purge('sqlite');
    DB::unprepared(file_get_contents(__DIR__.'/../../Fixtures/realtime.sqlite.sql'));
    DB::statement('CREATE TABLE meeting_signals (id INTEGER PRIMARY KEY, meeting_id INTEGER)');
    Cache::flush();
    Event::fake([StateChanged::class]);
    DB::table('meetings')->insert(['id' => 1, 'code' => 'testroom', 'host_id' => 11, 'kind' => 'call', 'status' => 'live']);
    foreach ([11, 12, 13] as $index => $id) {
        DB::table('meeting_participants')->insert(['id' => $id, 'meeting_id' => 1, 'user_id' => $id,
            'name' => 'Synthetic participant '.$id, 'role' => $index === 0 ? 'host' : 'participant', 'status' => 'joined', 'last_seen_at' => now()]);
    }
    foreach ([[1, 11, 12, 'active', 0], [2, 11, 13, 'active', 1], [3, 12, 14, 'ringing', 1]] as [$id, $caller, $callee, $status, $group]) {
        DB::table('friend_calls')->insert(['id' => $id, 'caller_id' => $caller, 'callee_id' => $callee, 'status' => $status,
            'video' => 1, 'audio_only' => 1, 'meeting_code' => 'testroom', 'group_invite' => $group,
            'created_at' => now(), 'updated_at' => now(), 'answered_at' => $status === 'active' ? now()->subSeconds(20) : null]);
    }
    DB::table('meeting_signals')->insert(['id' => 1, 'meeting_id' => 1]);
    $this->user = function (int $id) { $user = new User(); $user->id = $id; return $user; };
});

test('any joined participant hanging up closes the dialed room and every live invitation', function (int $id) {
    $participant = DB::table('meeting_participants')->find($id);
    app(MeetingService::class)->leave($participant);
    expect(DB::table('meetings')->value('status'))->toBe('ended');
    expect(DB::table('meeting_participants')->where('status', 'joined')->count())->toBe(0);
    expect(DB::table('friend_calls')->orderBy('id')->pluck('status')->all())->toBe(['ended', 'ended', 'cancelled']);
    expect(DB::table('meeting_signals')->count())->toBe(0);
    expect(DB::table('friend_messages')->count())->toBe(3);
    app(MeetingService::class)->leave($participant);
    expect(DB::table('friend_messages')->count())->toBe(3);
})->with([11, 12, 13]);

test('declining a dialed group invitation stops the shared call for everyone', function () {
    expect(app(FriendCallService::class)->decline(($this->user)(14), 3)[0])->toBeTrue();
    expect(DB::table('friend_calls')->orderBy('id')->pluck('status')->all())->toBe(['ended', 'ended', 'declined']);
    expect(DB::table('meetings')->value('status'))->toBe('ended');
    expect(DB::table('meeting_participants')->where('status', 'joined')->count())->toBe(0);
});

test('active call end endpoint closes its room for both callers and callees', function (int $id) {
    expect(app(FriendCallService::class)->end(($this->user)($id), 1)[0])->toBeTrue();
    expect(DB::table('meetings')->value('status'))->toBe('ended');
    expect(DB::table('friend_calls')->whereIn('status', ['ringing', 'active'])->count())->toBe(0);
    expect(DB::table('friend_messages')->count())->toBe(3);
    app(FriendCallService::class)->end(($this->user)($id), 1);
    expect(DB::table('friend_messages')->count())->toBe(3);
})->with([11, 12]);

test('unrelated users cannot decline or terminate another call', function () {
    expect(app(FriendCallService::class)->decline(($this->user)(99), 3)[0])->toBeFalse();
    expect(app(FriendCallService::class)->end(($this->user)(99), 1)[0])->toBeFalse();
    expect(DB::table('meetings')->value('status'))->toBe('live');
    expect(DB::table('friend_messages')->count())->toBe(0);
    Event::assertNotDispatched(StateChanged::class);
});

test('leaving or declining an invitation to a regular meeting keeps other participants connected', function () {
    DB::table('meetings')->update(['kind' => 'meeting']);
    app(MeetingService::class)->leave(DB::table('meeting_participants')->find(12));
    expect(DB::table('meetings')->value('status'))->toBe('live');
    expect(DB::table('meeting_participants')->where('status', 'joined')->count())->toBe(2);
    expect(app(FriendCallService::class)->decline(($this->user)(14), 3)[0])->toBeTrue();
    expect(DB::table('meetings')->value('status'))->toBe('live');
});

test('failed room cleanup rolls back call status so hangup can be retried', function () {
    DB::statement("CREATE TRIGGER fail_cleanup BEFORE DELETE ON meeting_signals BEGIN SELECT RAISE(ABORT, 'synthetic cleanup failure'); END");
    expect(fn () => app(FriendCallService::class)->end(($this->user)(12), 1))->toThrow(\Illuminate\Database\QueryException::class);
    expect(DB::table('meetings')->value('status'))->toBe('live');
    expect(DB::table('friend_calls')->where('id', 1)->value('status'))->toBe('active');
    expect(DB::table('friend_messages')->count())->toBe(0);
    Event::assertNotDispatched(StateChanged::class);
});

test('meeting end publishes an immediate identity scoped terminal event', function () {
    app(MeetingService::class)->endByCode('testroom');
    Event::assertDispatched(StateChanged::class, fn ($e) => $e->broadcastWith() === ['type' => 'meeting_ended', 'code' => 'testroom']
        && array_map(fn ($c) => $c->name, $e->broadcastOn()) === ['private-user.11', 'private-user.12', 'private-user.13']);
    Event::assertDispatched(StateChanged::class, fn ($e) => $e->broadcastWith() === ['type' => 'call_cancel', 'call_id' => 1, 'reason' => 'ended']);
});

test('authorized call and meeting signals are delivered only to the peer with replay ids', function () {
    foreach (['from_pid INTEGER', 'to_pid INTEGER', 'type TEXT', 'payload TEXT', 'created_at TEXT'] as $column) DB::statement('ALTER TABLE meeting_signals ADD COLUMN '.$column);
    $payload = json_encode(['candidate' => 'synthetic-ice']);
    expect(app(FriendCallService::class)->signal(($this->user)(99), 1, 'ice', $payload)[0])->toBeFalse();
    Event::assertNotDispatched(StateChanged::class);
    expect(app(FriendCallService::class)->signal(($this->user)(11), 1, 'ice', $payload)[0])->toBeTrue();
    Event::assertDispatched(StateChanged::class, fn ($e) => $e->broadcastWith() === ['type' => 'call_signal', 'call_id' => 1,
        'signal' => ['id' => 1, 'type' => 'ice', 'payload' => $payload]] && $e->broadcastOn()[0]->name === 'private-user.12');
    expect(app(MeetingService::class)->signal(DB::table('meeting_participants')->find(11), 12, 'ice', $payload)[0])->toBeTrue();
    Event::assertDispatched(StateChanged::class, fn ($e) => $e->broadcastWith() === ['type' => 'meeting_signal', 'code' => 'testroom', 'to' => 12,
        'signal' => ['id' => 2, 'from' => 11, 'type' => 'ice', 'payload' => $payload]] && $e->broadcastOn()[0]->name === 'private-user.12');
});


test('host end retry acknowledges an already ended room without duplicate logs', function () {
    $svc = app(MeetingService::class);
    expect($svc->host(DB::table('meeting_participants')->find(11), 'end', null)[0])->toBeTrue();
    expect($svc->host(DB::table('meeting_participants')->find(11), 'end', null)[0])->toBeTrue();
    expect(DB::table('friend_messages')->count())->toBe(3);
    expect($svc->host(DB::table('meeting_participants')->find(12), 'end', null)[0])->toBeFalse();
});

test('leaving a regular meeting immediately invalidates the remaining peers roster', function () {
    DB::table('meetings')->update(['kind' => 'meeting']);
    app(MeetingService::class)->leave(DB::table('meeting_participants')->find(12));
    Event::assertDispatched(StateChanged::class, fn ($e) => $e->broadcastWith() === ['type' => 'meeting_changed', 'code' => 'testroom']
        && array_map(fn ($c) => $c->name, $e->broadcastOn()) === ['private-user.11', 'private-user.13']);
});
