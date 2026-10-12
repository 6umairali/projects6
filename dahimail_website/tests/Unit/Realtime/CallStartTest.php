<?php

use App\Http\Controllers\Friends\FriendCallController;
use App\Http\Controllers\Meetings\MeetingController;
use App\Models\User;
use App\Services\FcmPush;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Vite;

beforeEach(function () {
    config(['database.default' => 'sqlite', 'database.connections.sqlite.database' => ':memory:',
        'broadcasting.default' => 'null', 'services.fcm.credentials' => null, 'services.apns.key_path' => null]);
    DB::purge('sqlite');
    DB::unprepared(file_get_contents(base_path('tests/Fixtures/realtime.sqlite.sql')));
    DB::statement('CREATE TABLE friend_requests (id INTEGER PRIMARY KEY, requester_id INTEGER, addressee_id INTEGER, status TEXT, unfriended_at TEXT)');
    DB::statement('CREATE TABLE workspace_members (workspace_id INTEGER, user_id INTEGER)');
    DB::statement('CREATE TABLE meeting_invitees (meeting_id INTEGER, user_id INTEGER)');
    foreach ([1 => 'Caller', 2 => 'Recipient'] as $id => $name) {
        DB::table('users')->insert(['id' => $id, 'uuid' => 'synthetic-'.$id, 'name' => $name, 'email' => $id.'@example.test', 'notification_preferences' => '{}']);
    }
    DB::table('friend_requests')->insert(['requester_id' => 1, 'addressee_id' => 2, 'status' => 'accepted']);
    $this->actingAs(User::find(1));
    $this->assets = sys_get_temp_dir().'/dahimail-call-assets-'.bin2hex(random_bytes(8));
    File::makeDirectory($this->assets.'/build', 0755, true);
    app()->usePublicPath($this->assets);
    Vite::useHotFile($this->assets.'/hot');
});

afterEach(function () { File::deleteDirectory($this->assets); });

test('website call creation dispatches the recipient push after the response', function (bool $audioOnly) {
    $push = Mockery::mock(FcmPush::class);
    $push->shouldReceive('sendCall')->once()->withArgs(fn ($user, $data, $ttl) =>
        $user->id === 2 && $data['call_id'] > 0 && $data['audio_only'] === $audioOnly && $ttl > 0);
    app()->instance(FcmPush::class, $push);
    $request = Request::create('/friends/api/calls/video/2'.($audioOnly ? '?audio=1' : ''), 'POST');
    $request->setUserResolver(fn () => User::find(1));
    $response = app(FriendCallController::class)->startVideo($request, 2);
    expect($response->getStatusCode())->toBe(200);
    expect($response->getData(true)['data']['meeting'])->not->toBeEmpty();
    expect(DB::table('friend_calls')->value('status'))->toBe('ringing');
    app()->terminate();
})->with([true, false]);

test('a call room remains usable when deployment lacks the optional realtime entry', function (bool $manifestExists) {
    if ($manifestExists) File::put($this->assets.'/build/manifest.json', json_encode([
        'resources/js/app.js' => ['file' => 'assets/app-old.js', 'isEntry' => true],
    ]));
    DB::table('meetings')->insert(['code' => 'testroom', 'host_id' => 1, 'title' => 'Audio call', 'kind' => 'call']);
    $request = Request::create('/meet/testroom');
    $request->setUserResolver(fn () => User::find(1));
    $html = app(MeetingController::class)->room($request, 'testroom')->render();
    expect($html)->toContain('id="mt"')->toContain('data-code="testroom"');
})->with([true, false]);


test('a built call room still loads its realtime module', function () {
    File::put($this->assets.'/build/manifest.json', json_encode([
        'resources/js/realtime.js' => ['file' => 'assets/realtime-test.js', 'src' => 'resources/js/realtime.js', 'isEntry' => true],
    ]));
    DB::table('meetings')->insert(['code' => 'testroom', 'host_id' => 1, 'title' => 'Audio call', 'kind' => 'call']);
    $request = Request::create('/meet/testroom');
    $request->setUserResolver(fn () => User::find(1));
    $html = app(MeetingController::class)->room($request, 'testroom')->render();
    expect($html)->toContain('type="module"')->toContain('/build/assets/realtime-test.js');
});
