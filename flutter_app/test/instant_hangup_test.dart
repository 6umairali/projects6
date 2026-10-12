import 'dart:async';
import 'package:dahimail/core/api.dart';
import 'package:dahimail/core/calls.dart';
import 'package:dahimail/core/meeting_engine.dart';
import 'package:dahimail/core/session.dart';
import 'package:flutter_test/flutter_test.dart';

class PendingApi extends Api {
  PendingApi() : super(Session());
  final response = Completer<dynamic>();
  final paths = <String>[];
  @override Future<dynamic> post(String path, [Object? body]) {
    paths.add(path);
    return response.future;
  }
}
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  test('audio hangup ends local state before an unresponsive server replies', () async {
    final api = PendingApi();
    final call = CallSession(api, {'id': 42, 'peer': {'name': 'Alice'}}, outgoing: true);
    CallManager.I.active = call;
    await call.hangUp().timeout(const Duration(seconds: 1));
    expect(call.state, 'ended');
    expect(CallManager.I.active, isNull);
    expect(api.paths, ['calls/42/end']);
    expect(api.response.isCompleted, false);
    api.response.complete({});
    call.dispose(); api.session.dispose();
  });
  test('meeting leave closes media state before server acknowledgement', () async {
    final api = PendingApi();
    final room = MeetingEngine(api, 'testroom')..pid = 7..phase = 'in';
    await room.leave().timeout(const Duration(seconds: 1));
    expect(room.phase, 'ended');
    expect(api.paths, ['meetings/testroom/leave']);
    expect(api.response.isCompleted, false);
    api.response.complete({});
    room.dispose(); api.session.dispose();
  });
}
