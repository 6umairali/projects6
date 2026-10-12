import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:provider/provider.dart';
import '../screens/call_screen.dart';
import '../screens/friend_chat_page.dart';
import '../screens/meeting_room_page.dart';
import 'api.dart';
import 'realtime.dart';
import 'meeting_recording.dart';
import 'android_callkit.dart';
import 'app_permissions.dart';
import 'callkit.dart';
import 'config.dart';
import 'nav.dart';
import 'notify.dart';
import 'notification_tile.dart';
import 'prefs.dart';
import 'room_host.dart';
import 'rtc_diagnostics.dart';
import 'session.dart';
import 'sounds.dart';
import 'refresh.dart';
import 'notification_presentation.dart';

typedef Json = Map<String, dynamic>;

/// One audio call (WebRTC). The audio goes straight between the two devices (or through the TURN relay); the server only
/// carries the set-up messages (offer / answer / network candidates). The website uses the same endpoints, so the app and the
/// website can call each other.
class CallSession extends ChangeNotifier {
  final Api api;
  final Json call;
  final bool outgoing;
  CallSession(this.api, this.call, {required this.outgoing}) : state = outgoing ? 'calling' : 'ringing';

  /// calling | ringing | connecting | connected | ended
  String state;
  String? endReason;
  bool muted = false, speaker = false;
  int seconds = 0;

  int get id => call['id'] as int;
  Json get peer => Map<String, dynamic>.from(call['peer'] as Map);
  String get peerName => '${peer['name']}';

  RTCPeerConnection? _pc;
  MediaStream? _local;
  int _last = 0;
  Timer? _sig, _clock, _statsTimer;
  bool _statsBusy = false;
  bool _remoteSet = false, _pulling = false, _closed = false;
  final _queue = <RTCIceCandidate>[];

  void _set(String s, {String? reason}) {
    state = s;
    if (reason != null) endReason = reason;
    notifyListeners();
  }

  Future<void> _post(String type, Object payload) async {
    try {
      await api.post('calls/$id/signal', {'type': type, 'payload': jsonEncode(payload)});
    } catch (_) {}
  }

  Future<bool> _prepare() async {
    if (!await AppPermissions.microphone()) {
      await _finish('Microphone permission is needed for calls. Allow it in your phone settings (Apps → ${AppConfig.appName} → Permissions).', tellServer: true);
      return false;
    }
    try {
      _local = await navigator.mediaDevices.getUserMedia({'audio': true, 'video': false});
      debugPrint('[RTC-DIAG][call] local audio tracks=${_local!.getAudioTracks().length} enabled=${_local!.getAudioTracks().map((t) => t.enabled).toList()}');
      _pc = await createPeerConnection({'iceServers': call['ice_servers'] ?? [], 'sdpSemantics': 'unified-plan'});
      final audioTracks = _local!.getAudioTracks();
      // Only the caller (who sends the offer) adds its transceivers up front. A transceiver made with addTransceiver()
      // is not reused for an incoming offer, so the callee attaches its microphone after setRemoteDescription instead.
      if (outgoing) {
        for (final t in audioTracks) {
          final transceiver = await _pc!.addTransceiver(
            track: t,
            init: RTCRtpTransceiverInit(
              direction: TransceiverDirection.SendRecv,
              streams: [_local!],
            ),
          );
          debugPrint('[RTC-DIAG][call] local audio direction=${await transceiver.getDirection()}');
        }
        if (audioTracks.isEmpty) {
          await _pc!.addTransceiver(
            kind: RTCRtpMediaType.RTCRtpMediaTypeAudio,
            init: RTCRtpTransceiverInit(direction: TransceiverDirection.RecvOnly),
          );
          debugPrint('[RTC-DIAG][call] added receive-only audio transceiver');
        }
      }
      _pc!.onTrack = (RTCTrackEvent e) {
        debugPrint('[RTC-DIAG][call] remote track kind=${e.track.kind} enabled=${e.track.enabled} streams=${e.streams.length}');
      };
      _pc!.onIceCandidate = (RTCIceCandidate c) {
        if (c.candidate != null) _post('ice', {'candidate': c.candidate, 'sdpMid': c.sdpMid, 'sdpMLineIndex': c.sdpMLineIndex});
      };
      _pc!.onIceConnectionState = (RTCIceConnectionState state) {
        debugPrint('[RTC-DIAG][call] ICE=$state');
      };
      _pc!.onConnectionState = (RTCPeerConnectionState s) {
        debugPrint('[RTC-DIAG][call] peer=$s');
        if (s == RTCPeerConnectionState.RTCPeerConnectionStateConnected) _connected();
        if (s == RTCPeerConnectionState.RTCPeerConnectionStateFailed) _finish('Connection lost', tellServer: true);
      };
      return true;
    } catch (_) {
      await _finish('Could not use the microphone', tellServer: true);
      return false;
    }
  }

  void _connected() {
    if (_clock != null) return;
    _set('connected');
    AndroidCallKit.connected();
    unawaited(_logAudioStats());
    _statsTimer = Timer.periodic(const Duration(seconds: 5), (_) => unawaited(_logAudioStats()));
    _clock = Timer.periodic(const Duration(seconds: 1), (_) {
      seconds++;
      notifyListeners();
    });
  }

  Future<void> _logAudioStats() async {
    final pc = _pc;
    if (pc == null || _closed || _statsBusy) return;
    _statsBusy = true;
    try {
      await logRtcAudioStats(pc, 'call');
    } finally {
      _statsBusy = false;
    }
  }

  /// Caller: create the offer and wait for the answer.
  Future<void> startOutgoing() async {
    if (!await _prepare()) return;
    try {
      final offer = await _pc!.createOffer({'offerToReceiveAudio': 1});
      debugPrint('[RTC-DIAG][call] offer hasAudio=${offer.sdp?.contains('m=audio') ?? false}');
      await _pc!.setLocalDescription(offer);
      await _post('offer', {'type': offer.type, 'sdp': offer.sdp});
      _loop();
    } catch (_) {
      await _finish('Could not start the call', tellServer: true);
    }
  }

  /// Callee: accept, then answer the offer that arrives through the signals.
  Future<void> accept() async {
    _set('connecting');
    try {
      await AndroidCallKit.answerInApp(id);
      await api.post('calls/$id/answer');
    } catch (_) {
      return _finish('The call is no longer available');
    }
    if (!await _prepare()) return;
    _loop();
  }

  Future<void> decline() async {
    unawaited(api.post('calls/$id/decline').catchError((_) {}));
    await _finish(null);
  }

  Future<void> hangUp() => _finish('Call ended', tellServer: true);

  final _inbox = SignalInbox();
  StreamSubscription<Map<String, dynamic>>? _realtime;
  Future<void> _signal(Map<String, dynamic> m) => _inbox.add(m, () async {
    if (_closed) return;
    await _handle('${m['type']}', '${m['payload']}');
  });

  void _loop() {
    _realtime ??= Realtime.I.events.listen((e) {
      if (e['type'] == 'reconnected') { _pull(); return; }
      if (e['call_id'] != id) return;
      if (e['type'] == 'call_signal') {
        if (_pc != null && e['signal'] is Map) {
          unawaited(_signal(Map<String, dynamic>.from(e['signal'] as Map)).catchError((_) {}));
        } else { _pull(); }
      }
    });
    _sig?.cancel();
    _sig = Timer.periodic(const Duration(seconds: 1), (_) => _pull());
    _pull();
  }

  Future<void> _pull() async {
    if (_pulling || _closed) return;
    _pulling = true;
    try {
      final j = Api.obj(await api.getNoCache('calls/$id/signals', query: {'after': '$_last'}));
      if (_closed) return;
      final signals = (j['signals'] as List? ?? const []);
      for (final s in signals) {
        final m = Map<String, dynamic>.from(s as Map);
        _last = (m['id'] as int) > _last ? m['id'] as int : _last;
        await _signal(m);
      }
      final st = '${j['status']}';
      if (const ['ended', 'declined', 'cancelled', 'missed'].contains(st)) {
        await _finish(st == 'declined' ? 'Call declined' : (st == 'missed' ? 'No answer' : 'Call ended'));
      } else if (st == 'active' && state == 'calling') {
        _set('connecting');
      }
    } on ApiException catch (e) {
      if (e.status == 404) await _finish('Call ended');
    } catch (_) {
    } finally {
      _pulling = false;
    }
  }

  Future<void> _handle(String type, String payload) async {
    final pc = _pc;
    if (pc == null) return;
    final d = jsonDecode(payload) as Map<String, dynamic>;
    try {
      if (type == 'offer') {
        await pc.setRemoteDescription(RTCSessionDescription(d['sdp'] as String?, d['type'] as String?));
        _remoteSet = true;
        // callee: send the microphone on the transceiver the offer created (addTrack reuses it and makes it sendrecv)
        final local = _local;
        if (local != null) {
          for (final t in local.getAudioTracks()) {
            try { await pc.addTrack(t, local); } catch (_) {}
          }
        }
        await _flush();
        final answer = await pc.createAnswer({'offerToReceiveAudio': 1});
        debugPrint('[RTC-DIAG][call] answer hasAudio=${answer.sdp?.contains('m=audio') ?? false}');
        await pc.setLocalDescription(answer);
        await _post('answer', {'type': answer.type, 'sdp': answer.sdp});
      } else if (type == 'answer') {
        await pc.setRemoteDescription(RTCSessionDescription(d['sdp'] as String?, d['type'] as String?));
        _remoteSet = true;
        await _flush();
      } else if (type == 'ice') {
        final c = RTCIceCandidate(d['candidate'] as String?, d['sdpMid'] as String?, d['sdpMLineIndex'] as int?);
        if (_remoteSet) {
          await pc.addCandidate(c);
        } else {
          _queue.add(c);
        }
      }
    } catch (_) {}
  }

  Future<void> _flush() async {
    for (final c in List.of(_queue)) {
      try {
        await _pc?.addCandidate(c);
      } catch (_) {}
    }
    _queue.clear();
  }

  void toggleMute() {
    muted = !muted;
    for (final t in _local?.getAudioTracks() ?? const <MediaStreamTrack>[]) {
      t.enabled = !muted;
    }
    notifyListeners();
  }

  Future<void> toggleSpeaker() async {
    speaker = !speaker;
    try {
      await Helper.setSpeakerphoneOn(speaker);
    } catch (_) {}
    notifyListeners();
  }

  Future<void> _finish(String? reason, {bool tellServer = false}) async {
    if (_closed) return;
    _closed = true;
    _sig?.cancel();
    _clock?.cancel();
    _statsTimer?.cancel();
    _realtime?.cancel();
    _set('ended', reason: reason);
    CallManager.I._ended(this);
    if (tellServer) unawaited(api.post('calls/$id/end').catchError((_) {}));
    try {
      for (final t in _local?.getTracks() ?? const <MediaStreamTrack>[]) {
        await t.stop();
      }
      await _local?.dispose();
      await _pc?.close();
    } catch (_) {}
    _pc = null;
    _local = null;
  }
}

/// Keeps listening for incoming calls while the app is open and starts outgoing calls.
/// (Without a push service the phone cannot ring while the app is closed.)
class CallManager with WidgetsBindingObserver {
  CallManager._();
  static final CallManager I = CallManager._();

  Session? _session;
  StreamSubscription<Map<String, dynamic>>? _realtime;
  final _cancelledCalls = <int>{};
  void _live(Map<String, dynamic> event) {
    final id = (event['call_id'] as num?)?.toInt();
    if (event['type'] == 'call_cancel' && id != null && event['reason'] != 'answered') {
      _cancelledCalls.add(id);
      if (_cancelledCalls.length > 256) _cancelledCalls.remove(_cancelledCalls.first);
      if (active?.id == id) active?._finish('Call ended');
      if (incomingVideo?['id'] == id) {
        incomingVideo = null;
        _stopRing();
        _videoId = null;
        incomingMinimized = false;
        videoGone.value++;
        overlayChanged.value++;
      }
      NotifyService.dismissSystemIncomingCall(id).catchError((_) {});
      CallKitBridge.endByCallId(id, '${event['reason']}');
    }
    if (const ['call', 'call_cancel', 'reconnected'].contains(event['type'])) { _tickAgain = _busy; _tick(); }
  }
  final Set<int> _pendingDeclines = {};
  final Set<int> _pendingEnds = {};
  int? _nativeCallId;
  int? _backgroundCallId;

  void endCallFromNative(int id) {
    final s = _session;
    if (s == null) { _pendingEnds.add(id); return; }
    Api(s).post('calls/$id/end').catchError((_) {});
    if (_nativeCallId == id || active?.id == id) endFromSystem();
  }
  Timer? _poll, _ring, _rb;
  bool _tickAgain = false;
  bool _busy = false, _foreground = true, _ringing = false;
  CallSession? active;
  int? _msgSeen;       // newest friend-message id already announced
  bool inRoom = false;  // a meeting / video call is on screen: no second ringing screen on top of it
  int? _videoId;        // the incoming VIDEO call that is on screen
  bool _videoOpen = false;
  Json? incomingVideo;
  bool incomingMinimized = false, legacyMinimized = false;
  final ValueNotifier<int> overlayChanged = ValueNotifier(0);

  void minimizeIncoming(Json call) {
    incomingVideo = call;
    incomingMinimized = true;
    _leaveRingingScreen(call);
    overlayChanged.value++;
  }

  void expandIncoming({String? action}) {
    final c = incomingVideo;
    if (c == null || !incomingMinimized) return;
    incomingMinimized = false;
    _videoId = null;
    _videoOpen = false;
    NotifyService.I.pendingCallAction = action;
    NotifyService.I.pendingCallId = c['id'] as int;
    overlayChanged.value++;
    _showVideo(c);
  }

  void minimizeLegacy() {
    legacyMinimized = true;
    final call = active;
    if (call != null && !call.outgoing && call.state == 'ringing') _leaveRingingScreen(call.call);
    overlayChanged.value++;
  }

  void _leaveRingingScreen(Map call) {
    _ringing = false;
    _ring?.cancel();
    _ring = null;
    SoundPlayer.stopRingtone();
    if (defaultTargetPlatform == TargetPlatform.android) {
      _showBackgroundCall(call, minimized: true).catchError((_) {});
    }
  }
  void expandLegacy() {
    final c = active;
    if (c == null || !legacyMinimized) return;
    legacyMinimized = false;
    overlayChanged.value++;
    rootNavKey.currentState?.push(MaterialPageRoute(fullscreenDialog: true, builder: (_) => CallScreen(session: c)));
  }
  final ValueNotifier<int> incomingAction = ValueNotifier(0);
  final ValueNotifier<int> videoGone = ValueNotifier(0); // the caller hung up before you answered
  int? openChatId;     // the chat that is open on screen right now (no alert for it)
  /// How many friend / teammate messages are waiting (badge on the Chats tab).
  final ValueNotifier<int> unreadChat = ValueNotifier(0);
  int _readRevision = 0;
  void applyUnreadReceipt(int remaining) {
    _readRevision++;
    unreadChat.value = remaining;
  }

  void attach(Session s) {
    _session = s;
    Realtime.I.start(Api(s));
    _realtime ??= Realtime.I.events.listen(_live);
    if (_poll == null) unawaited(MeetingRecording.recover(Api(s)).catchError((_) {}));
    _foreground = WidgetsBinding.instance.lifecycleState == AppLifecycleState.resumed;
    for (final id in _pendingDeclines.toList()) { declineFromSystem(id); }
    _pendingDeclines.clear();
    for (final id in _pendingEnds.toList()) { endCallFromNative(id); }
    _pendingEnds.clear();
    NotifyService.I.onCallAction = _onNotifAction;
    if (_poll != null) return;
    WidgetsBinding.instance.addObserver(this);
    _poll = Timer.periodic(const Duration(seconds: 4), (_) => _tick());
    Future.microtask(_tick); // a call that is already ringing shows at once (e.g. opened from the notification)
  }

  /// Buttons / taps on the call notifications.
  void _onNotifAction(String a) {
    if (a == 'incoming') { incomingAction.value++; _tick(); return; }
    if (a == 'end') { active?.hangUp(); RoomHost.I.endNow(); }
    if (a == 'expand') RoomHost.I.expand();
  }

  void detach() {
    _realtime?.cancel();
    _realtime = null;
    Realtime.I.stop();
    _cancelledCalls.clear();
    _poll?.cancel();
    _poll = null;
    _stopRing();
    WidgetsBinding.instance.removeObserver(this);
    _session = null;
    final backgroundId = _backgroundCallId;
    _backgroundCallId = null;
    if (backgroundId != null) NotifyService.dismissSystemIncomingCall(backgroundId).catchError((_) {});
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState s) {
    _foreground = s == AppLifecycleState.resumed;
    if (_foreground) { Realtime.I.reconnect(); _backgroundCallId = null; _tick(); AppRefresh.bump(); }
    if (s == AppLifecycleState.paused && defaultTargetPlatform == TargetPlatform.android && !inRoom) {
      final legacy = active;
      final call = incomingVideo ?? (legacy != null && !legacy.outgoing && legacy.state == 'ringing' ? legacy.call : null);
      if (call != null && call['sent_at'] != null) {
        _ringing = false;
        _ring?.cancel();
        _ring = null;
        SoundPlayer.stopRingtone();
        _showBackgroundCall(call, minimized: true).catchError((_) {});
      }
    }
  }

  Future<void> _showBackgroundCall(Map call, {bool minimized = false}) async {
    final id = int.tryParse('${call['id']}');
    // Never invent a new deadline for a stale/incomplete polling response.
    if (id == null || call['sent_at'] == null || _backgroundCallId == id) return;
    final peer = call['peer'] is Map ? call['peer'] as Map : const {};
    _backgroundCallId = id;
    try {
      await NotifyService.showIncomingCall({
        'minimized': minimized,
        'call_id': id, 'sent_at': call['sent_at'], 'ttl': call['ttl'] ?? 45,
        'caller_name': peer['name'], 'caller_avatar': peer['avatar_url'],
        'video': call['video'], 'audio_only': call['audio_only'],
        'group': call['group'], 'meeting': call['meeting'],
        'recipient_user_id': _session?.userId,
      });
    } catch (_) {
      if (_backgroundCallId == id) _backgroundCallId = null;
      rethrow;
    }
  }

  /// A push arrived while the app is open: look at the server right now instead of waiting for the timer.
  void pollNow() => _tick();

  /// Modern audio/video calls carry their room in the push. Show the invitation
  /// immediately, even if the accompanying poll is delayed. Accept still checks
  /// the call's status with the server before joining.
  void incomingPush(Map<String, dynamic> data) {
    final id = int.tryParse('${data['call_id']}');
    final sent = int.tryParse('${data['sent_at']}');
    final ttl = int.tryParse('${data['ttl']}') ?? 45;
    final room = '${data['meeting'] ?? ''}';
    final expired = sent != null && DateTime.now().millisecondsSinceEpoch ~/ 1000 >= sent + ttl;
    if (_foreground && _session?.isLoggedIn == true && !expired && id != null && !CallKitBridge.ringing.contains(id) && room.isNotEmpty && !inRoom && active == null) {
      _showVideo({
        'id': id, 'video': true, 'meeting': room, 'status': 'ringing', 'sent_at': sent, 'ttl': ttl,
        'audio_only': NotificationPresentation.flag(data['audio_only']), 'group': NotificationPresentation.flag(data['group']),
        'peer': {'id': int.tryParse('${data['caller_id']}'), 'name': '${data['caller_name'] ?? 'Dahimail'}', 'avatar_url': data['caller_avatar']},
      });
    }
    pollNow();
  }

  // ── iPhone system call screen (CallKit) ──
  DateTime? _systemAnswerAt;
  /// Answer was pressed on the system call screen: continue even though the app may still be in the background
  /// (audio calls keep running there; the picture appears when the person opens the app).
  void answeredBySystem([int? callId]) {
    NotifyService.I.pendingCallId = callId;
    _nativeCallId = callId;
    _systemAnswerAt = DateTime.now();
    _tick();
  }
  bool get _systemAnswerPending => _systemAnswerAt != null && DateTime.now().difference(_systemAnswerAt!).inSeconds < 60;
  /// Declined on the system call screen.
  void declineFromSystem(int callId) {
    final s = _session;
    if (s == null) { _pendingDeclines.add(callId); return; }
    Api(s).post('calls/$callId/decline').catchError((_) {});
    _stopRing();
  }
  /// Hung up on the system call screen / the green call pill.
  void endFromSystem() {
    NotifyService.I.onCallAction?.call('end');
  }
  /// Mute pressed on the system call screen.
  void muteFromSystem(bool muted) {
    final e = RoomHost.I.engine;
    if (e != null && e.micOn == muted) RoomHost.I.toggleMute();
  }

  /// true while a device in the call (possibly the friend's browser) is recording it – shown as a red notice in the call screen.
  final ValueNotifier<bool> recordingActive = ValueNotifier(false);

  Future<void> _tick() async {
    final s = _session;
    if (_busy || s == null || !s.isLoggedIn) return;
    _busy = true;
    try {
      final readRevision = _readRevision;
      final j = Api.obj(await Api(s).getNoCache('calls/poll'));
      if (_session != s || !s.isLoggedIn) return;
      // A failed chat alert must not prevent an incoming call from opening.
      try { if (readRevision == _readRevision) await _messages(j['messages']); } catch (_) {}
      final rawCurrent = j['current'];
      final cur = rawCurrent is Map && _cancelledCalls.contains(rawCurrent['id']) ? null : rawCurrent;
      final rec = cur is Map && cur['recording_active'] == true;
      if (recordingActive.value != rec) recordingActive.value = rec;
      final rawIncoming = j['incoming'];
      final inc = rawIncoming is Map && _cancelledCalls.contains(rawIncoming['id']) ? null : rawIncoming;
      final incomingId = inc is Map ? (inc['id'] as num).toInt() : null;
      final backgroundId = _backgroundCallId;
      if (backgroundId != null && backgroundId != incomingId) {
        _backgroundCallId = null;
        await NotifyService.dismissSystemIncomingCall(backgroundId);
      }
      AndroidCallKit.syncRinging(incomingId);
      if (!_foreground && incomingId != null && AndroidCallKit.ringing.containsKey(incomingId) && NotifyService.I.pendingCallAction == null) return;
      if (CallKitBridge.supported) {
        // the system call screen shows what the server still rings; anything else disappears from it
        CallKitBridge.syncRinging([if (inc is Map && inc['id'] != null) (inc['id'] as num).toInt()]);
        if (inc is Map && inc['id'] != null && CallKitBridge.ringing.contains((inc['id'] as num).toInt())) return; // CallKit is ringing: no second ring screen
      }
      if (!_foreground && !_systemAnswerPending) {
        // Polling can find a call even when its push was delayed or unavailable.
        // Hand it to Android before skipping Flutter navigation in the background.
        if (defaultTargetPlatform == TargetPlatform.android && inc is Map && !inRoom && NotifyService.I.pendingCallAction == null) {
          await _showBackgroundCall(inc);
        }
        return;
      }
      if (inc is Map && NotifyService.I.pendingCallAction != null && NotifyService.I.pendingCallId != inc['id']) {
        NotifyService.I.pendingCallAction = null;
        NotifyService.I.pendingCallId = null;
      }
      if (inc == null) {
        if (_systemAnswerPending && !inRoom && active == null) {
          _systemAnswerAt = null;
          AndroidCallKit.endAll().catchError((_) {});
          CallKitBridge.endAll();
        }
        if (cur == null && !inRoom && active == null) AndroidCallKit.endAll().catchError((_) {});
        if (incomingVideo != null || incomingMinimized) _stopRing();
        NotifyService.I.pendingCallAction = null;
        NotifyService.I.pendingCallId = null;
        NotifyService.I.cancelCallNotification(callId: _videoId);
        incomingVideo = null;
        incomingMinimized = false;
        _videoId = null;
        overlayChanged.value++;
      }
      if (incomingMinimized && NotifyService.I.pendingCallAction != null) expandIncoming(action: NotifyService.I.pendingCallAction);
      if (inc is Map && _systemAnswerPending) _systemAnswerAt = null;
      if (inc is Map && inc['video'] == true && inc['meeting'] != null) {
        if (!inRoom && active == null) _showVideo(Map<String, dynamic>.from(inc)); // a video call rings on its own screen
        return;
      }
      if (_videoOpen && inc == null) {
        _stopRing();
        videoGone.value++; // the ringing screen closes itself
      }
      if (active == null && inc is Map) {
        _show(CallSession(Api(s), Map<String, dynamic>.from(inc), outgoing: false));
      } else if (active != null && !active!.outgoing && active!.state == 'ringing' && inc == null) {
        active!._finish('Missed call'); // the caller gave up
      }
      final legacy = active;
      final action = NotifyService.I.pendingCallAction;
      if (legacy != null && legacy.state == 'ringing' && NotifyService.I.pendingCallId == legacy.id && action != null) {
        NotifyService.I.pendingCallAction = null;
        ringStop();
        if (action == 'call_accept') await legacy.accept();
        if (action == 'call_decline') await legacy.decline();
      }
    } catch (_) {
    } finally {
      _busy = false;
      if (_tickAgain && _session != null) { _tickAgain = false; scheduleMicrotask(_tick); }
    }
  }

  /// New friend message (or missed call): sound + banner while the app is open, a system notification when it is not.
  Future<void> _messages(dynamic m) async {
    if (m is! Map) return;
    final waiting = (m['unread'] as num?)?.toInt() ?? 0;
    if (unreadChat.value != waiting) unreadChat.value = waiting;
    final l = m['latest'];
    if (_msgSeen == null) {
      _msgSeen = l is Map ? (l['id'] as int) : 0; // first look: remember what is already there, announce only what comes next
      return;
    }
    if (l is! Map) return;
    final id = l['id'] as int;
    if (id <= _msgSeen!) return;
    _msgSeen = id;
    AppRefresh.bump();
    final from = l['from_id'] as int;
    if (_foreground && openChatId == from) return; // you are reading that chat
    if (NotifyService.I.hasShownChatMessage(id)) return;
    final ctx = rootNavKey.currentContext;
    if (ctx == null) return;
    final prefs = ctx.read<AppPrefs>();
    if (!prefs.notifEnabled || !prefs.notifMessages || prefs.inQuietHours) return;
    if (l['kind'] == 'call' && NotifyService.I.pushActive) return;
    final name = '${l['from_name']}';
    final text = l['kind'] == 'call' ? '📞 ${l['preview']}' : '${l['preview']}';
    if (_foreground) {
      if (prefs.inAppSound) SoundPlayer.play(prefs.soundId);
      ScaffoldMessenger.maybeOf(ctx)?.showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(8),
        padding: EdgeInsets.zero,
        backgroundColor: Theme.of(ctx).colorScheme.surface,
        content: NotificationTile(
          compact: true,
          notification: {'type': l['kind'] == 'call' ? 'missed_call' : 'chat', 'sender_name': name, 'sender_avatar': l['from_avatar'], 'body': text},
          onTap: () => rootNavKey.currentState?.push(MaterialPageRoute(builder: (_) => FriendChatPage(friend: {'id': from, 'name': name, 'avatar_url': l['from_avatar']}, features: const {'chat': true, 'files': true, 'calls': true, 'max_mb': 10}))),
        ),
        duration: const Duration(seconds: 4),
      ));
    } else if (!NotifyService.I.pushActive && await NotifyService.I.allowed()) {
      // with push the server already sent this notification – a second one here would be a duplicate
      await NotifyService.I.show(id: 7000 + from, title: name, body: text, category: 'messages', prefs: prefs);
    }
  }

  void _show(CallSession c) {
    active = c;
    if (!c.outgoing) _startRing();
    final nav = rootNavKey.currentState;
    nav?.push(MaterialPageRoute(fullscreenDialog: true, builder: (_) => CallScreen(session: c)));
  }

  /// Audio call = an audio-only room (so more people can be added during the call, and the camera can be switched on later).
  Future<void> startCall(BuildContext context, int friendId) => startVideoCall(context, friendId, '', audioOnly: true);

  /// The old one-to-one audio engine (kept only for calls that come from an older app version).
  Future<void> startLegacyCall(BuildContext context, int friendId) async {
    final s = _session;
    if (s == null || active != null) return;
    try {
      final raw = await Api(s).post('friends/$friendId/call');
      final data = raw is Map ? raw['data'] : null;
      if (data is! Map) throw ApiException(422, raw is Map ? '${raw['message'] ?? 'Could not start the call'}' : 'Could not start the call');
      final c = CallSession(Api(s), Map<String, dynamic>.from(data), outgoing: true);
      _show(c);
      _startRingback(c);
      await c.startOutgoing();
    } on ApiException catch (e) {
      if (context.mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message)));
    }
  }

  void _showVideo(Json c) {
    final id = (c['id'] as num).toInt();
    if (_videoOpen || _videoId == id || incomingMinimized) return;
    if (rootNavKey.currentState == null) return;
    incomingVideo = c;
    _videoId = id;
    _videoOpen = true;
    _startRing();
    final act = NotifyService.I.pendingCallAction; // Answer / Decline pressed on the notification
    NotifyService.I.pendingCallAction = null;
    rootNavKey.currentState?.push(MaterialPageRoute(fullscreenDialog: true, builder: (_) => IncomingVideoCallPage(call: c, autoAction: act))).whenComplete(() {
      _videoOpen = false;
      if (!incomingMinimized) { incomingVideo = null; _stopRing(); }
      overlayChanged.value++;
    });
  }

  /// From the chat / profile: a private 2-person video room; the friend's phone (or browser) rings.
  Future<void> startVideoCall(BuildContext context, int friendId, String name, {bool audioOnly = false}) async {
    final s = _session;
    if (s == null || active != null || inRoom) return;
    try {
      final raw = await Api(s).post('friends/$friendId/video-call', {'audio_only': audioOnly});
      final data = raw is Map ? raw['data'] : null;
      final code = data is Map ? data['meeting'] : null;
      if (code == null) throw ApiException(422, raw is Map ? '${raw['message'] ?? 'Could not start the video call'}' : 'Could not start the video call');
      if (context.mounted) await Navigator.of(context).push(MaterialPageRoute(fullscreenDialog: true, builder: (_) => MeetingRoomPage(code: '$code', title: name.isEmpty ? '${audioOnly ? 'Audio' : 'Video'} call' : '${audioOnly ? 'Audio' : 'Video'} call with $name', autoJoin: true, audioOnly: audioOnly)));
    } on ApiException catch (e) {
      if (context.mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message)));
    }
  }

  /// Incoming call: a looping ringtone + vibration.
  Future<void> _startRing() async {
    _stopRing();
    _ringing = true;
    HapticFeedback.vibrate();
    _ring = Timer.periodic(const Duration(seconds: 2), (_) => HapticFeedback.vibrate());
    await SoundPlayer.startRingtone();
    if (!_ringing) await SoundPlayer.stopRingtone();
  }

  void _stopRing() {
    NotifyService.I.cancelCallNotification(callId: _videoId ?? active?.id); // the ringing notification is no longer needed
    _ringing = false;
    _ring?.cancel();
    _ring = null;
    SoundPlayer.stopRingtone();
  }

  /// The caller hears a soft tone while the other phone is ringing.
  void _startRingback(CallSession c) {
    _rb?.cancel();
    _rb = Timer.periodic(const Duration(seconds: 3), (t) {
      if (c.state != 'calling' || !identical(active, c)) {
        t.cancel();
        return;
      }
      SoundPlayer.play('ping');
    });
  }

  void ringStop() => _stopRing();

  void _ended(CallSession c) {
    _stopRing();
    if (identical(active, c)) active = null;
    AndroidCallKit.endAll().catchError((_) {});
    CallKitBridge.endAll();
    legacyMinimized = false;
    overlayChanged.value++;
  }
}