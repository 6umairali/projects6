import 'dart:async';
import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import '../screens/meeting_room_page.dart';
import 'api.dart';
import 'android_callkit.dart';
import 'app_permissions.dart';
import 'calls.dart';
import 'callkit.dart';
import 'native_calls.dart';
import 'nav.dart';
import 'util.dart';
import 'meeting_engine.dart';
import 'notify.dart';

/// Owns the ONE call / meeting that is running, independent of the screen that shows it.
/// - Back / "minimize" closes the big screen but the call keeps running (small floating window + ongoing notification).
/// - Tapping the small window or the notification brings the full screen back.
class RoomHost extends ChangeNotifier with WidgetsBindingObserver {
  RoomHost._() {
    WidgetsBinding.instance.addObserver(this);
    NativeCalls.wire();
    // buttons of the floating call window that is shown over OTHER apps (Android)
    NativeCalls.onOverlayAction = (a) {
      if (a == 'expand') expand();
      if (a == 'mute') toggleMute();
      if (a == 'end') endNow();
    };
  }
  bool _overlayOn = false;
  int? _consentOpen; // session id of the consent question that is on screen

  /// Mode 3 ("everybody must agree"): the question must reach the person wherever they are in the app – also while the call is
  /// minimised. If the phone is in the background nothing can be shown and the request simply times out = counts as "no".
  void _recording(MeetingEngine e) {
    final c = e.recConsent;
    final ctx = rootNavKey.currentContext;
    if (ctx != null && ctx.mounted) {
      final n = e.recNotice;
      if (n != null) { e.recNotice = null; toast(ctx, n); }
    }
    if (c == null) {
      if (_consentOpen != null && ctx != null && ctx.mounted) { Navigator.of(ctx, rootNavigator: true).maybePop(); }
      _consentOpen = null;
      return;
    }
    final sid = (c['session_id'] as num).toInt();
    if (_consentOpen == sid || ctx == null || !ctx.mounted) return;
    _consentOpen = sid;
    final late = c['late'] == true;
    final what = e.meeting['kind'] == 'call' ? 'call' : 'meeting';
    showDialog<bool>(
      context: ctx,
      barrierDismissible: false,
      useRootNavigator: true,
      builder: (d) => AlertDialog(
        icon: const Icon(Icons.fiber_manual_record_rounded, color: Colors.red, size: 30),
        title: Text(late ? 'This $what is being recorded' : '${c['requester'] ?? 'Someone'} wants to record this $what'),
        content: Text(late ? 'Do you agree to be recorded? If you decline, the recording stops.' : 'Recording only starts if everybody allows it.'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(d, false), child: const Text('Decline')),
          FilledButton(onPressed: () => Navigator.pop(d, true), child: const Text('Allow')),
        ],
      ),
    ).then((ok) {
      if (_consentOpen == sid) _consentOpen = null;
      if (ok != null) e.recRespond(sid, ok); // null = closed by the server (answered elsewhere / expired)
    });
  }

  bool get _videoNow => engine != null && engine!.camOn && engine!.hasVideoTrack;

  /// The app goes to the background while a call runs → the call must stay visible, like WhatsApp:
  ///  • audio call  → small floating window over the other app (needs the "display over other apps" permission)
  ///  • video call  → Picture-in-Picture (armed in _watch; Android shrinks the call when Home is pressed)
  @override
  void didChangeAppLifecycleState(AppLifecycleState s) {
    final e = engine;
    if (!Platform.isAndroid) return;
    if (s == AppLifecycleState.resumed) {
      if (_overlayOn) { _overlayOn = false; NativeCalls.overlayHide(); }
      return;
    }
    if ((s == AppLifecycleState.paused || s == AppLifecycleState.hidden) && e != null && (e.phase == 'in') && !_videoNow && !_overlayOn) {
      NativeCalls.canDraw().then((ok) {
        if (!ok || engine == null || _overlayOn) return;
        _overlayOn = true;
        NativeCalls.overlayShow(_name, since, !engine!.micOn);
      });
    }
  }

  String get _name => (title == null || title!.isEmpty) ? (audioOnly ? 'Audio call' : 'Video call') : title!;
  static final RoomHost I = RoomHost._();

  MeetingEngine? engine;
  String? code, title;
  bool audioOnly = false, minimized = false, pageOpen = false;
  bool _service = false, _serviceVideo = false;
  DateTime? since;

  bool get showMini => engine != null && minimized && (engine!.phase == 'in' || engine!.phase == 'waiting' || engine!.phase == 'joining');

  /// Returns the running engine for this room, or creates it (first time the screen opens).
  MeetingEngine obtain(Api api, String roomCode, String? roomTitle, bool audio) {
    if (engine != null && code == roomCode) return engine!;
    _drop();
    final e = MeetingEngine(api, roomCode);
    engine = e;
    code = roomCode;
    title = roomTitle;
    audioOnly = audio;
    since = null;
    minimized = false;
    e.addListener(_watch);
    CallManager.I.inRoom = true;
    return e;
  }

  void _drop() {
    final old = engine;
    if (old == null) return;
    old.removeListener(_watch);
    engine = null;
    old.shutdown().whenComplete(old.dispose);
  }

  // Notifications must never fire while Flutter is building / tearing down the tree.
  void _poke() => scheduleMicrotask(notifyListeners);

  void _watch() {
    final e = engine;
    if (e == null) return;
    if (e.phase == 'in') {
      since ??= DateTime.now();
      if (!_service || _serviceVideo != _videoNow) {
        if (!_service) AndroidCallKit.connected();
        _service = true;
        _serviceVideo = _videoNow;
        // keeps the microphone (and camera) alive while the app is in the background / another app is open
        NotifyService.I.startCallService(title: (title == null || title!.isEmpty) ? 'Call in progress' : title!, video: e.camOn && e.hasVideoTrack);
      }
    }
    _recording(e);
    NativeCalls.pipArm(e.phase == 'in' && _videoNow);
    if (_overlayOn) NativeCalls.overlayUpdate(_name, since, !e.micOn);
    if ((e.phase == 'ended' || e.phase == 'error') && minimized) {
      final why = e.message ?? 'The call has ended.';
      scheduleMicrotask(() => closeRoom(message: why));
      return;
    }
    _poke();
  }

  void minimize() {
    minimized = true;
    _poke();
    AppPermissions.floatingWindow(); // asks once (with an explanation) for the "display over other apps" permission
  }

  /// Small window / notification tapped: show the full screen again.
  void expand() {
    if (engine == null || !minimized) return;
    minimized = false;
    _poke();
    rootNavKey.currentState?.push(MaterialPageRoute(fullscreenDialog: true, builder: (_) => MeetingRoomPage(code: code!, title: title, autoJoin: true, audioOnly: audioOnly)));
  }

  void toggleMute() => engine?.toggleMic();

  /// End button of the small window / notification. In a 1:1 call the caller ends it for both; otherwise you just leave.
  Future<void> endNow() async {
    final e = engine;
    if (e == null) return;
    final isCall = e.meeting['kind'] == 'call';
    try {
      if (isCall && e.isHost && e.participants.length <= 2) {
        await e.endForAll();
      } else {
        await e.leave();
      }
    } catch (_) {}
    if (e.phase != 'ended') return; // Keep the room open while a recording upload needs retry.
    if (pageOpen) {
      rootNavKey.currentState?.pop(); // the screen's dispose() cleans up
    } else {
      await closeRoom();
    }
  }

  Future<void> closeRoom({String? message}) async {
    final e = engine;
    if (e == null) return;
    engine = null;
    code = null;
    minimized = false;
    final hadCall = since != null;
    since = null;
    e.removeListener(_watch);
    CallManager.I.inRoom = false;
    NativeCalls.pipArm(false);
    AndroidCallKit.endAll().catchError((_) {});
    CallKitBridge.endAll(); // iPhone: the green call pill / system call ends with the call
    if (_overlayOn) { _overlayOn = false; NativeCalls.overlayHide(); }
    if (hadCall) Future.delayed(const Duration(seconds: 2), AppPermissions.offerBatteryHelp); // once, after the first call
    if (_service) {
      _service = false;
      await NotifyService.I.stopCallService();
    }
    _poke();
    try {
      await e.shutdown();
    } catch (_) {}
    e.dispose();
    if (message != null) {
      final ctx = rootNavKey.currentContext;
      if (ctx != null) ScaffoldMessenger.maybeOf(ctx)?.showSnackBar(SnackBar(content: Text(message)));
    }
  }
}

/// Small draggable call window shown above every screen while a call / meeting is minimized.
class MiniCallOverlay extends StatefulWidget {
  const MiniCallOverlay({super.key});
  @override
  State<MiniCallOverlay> createState() => _MiniCallOverlayState();
}

class _MiniCallOverlayState extends State<MiniCallOverlay> {
  Timer? _t;
  Offset? _pos;

  @override
  void initState() {
    super.initState();
    RoomHost.I.addListener(_r);
    CallManager.I.overlayChanged.addListener(_r);
    _t = Timer.periodic(const Duration(seconds: 1), (_) {
      if (mounted && RoomHost.I.showMini) setState(() {});
    });
  }

  void _r() {
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    _t?.cancel();
    RoomHost.I.removeListener(_r);
    CallManager.I.overlayChanged.removeListener(_r);
    super.dispose();
  }

  String _elapsed() {
    final s = RoomHost.I.since;
    if (s == null) return 'Connecting…';
    final d = DateTime.now().difference(s).inSeconds;
    final h = d ~/ 3600, m = (d % 3600) ~/ 60, x = d % 60;
    final mm = m.toString().padLeft(2, '0'), xx = x.toString().padLeft(2, '0');
    return h > 0 ? '$h:$mm:$xx' : '$mm:$xx';
  }

  Widget _btn(IconData icon, VoidCallback onTap, {bool danger = false, bool off = false}) => Material(
        color: danger ? Colors.red : (off ? Colors.white : Colors.white24),
        shape: const CircleBorder(),
        child: InkWell(customBorder: const CircleBorder(), onTap: onTap, child: Padding(padding: const EdgeInsets.all(8), child: Icon(icon, size: 20, color: off ? Colors.black87 : Colors.white))),
      );

  @override
  Widget build(BuildContext context) {
    final h = RoomHost.I;
    final calls = CallManager.I;
    final legacy = calls.legacyMinimized && calls.active?.state != 'ringing' ? calls.active : null;
    if (legacy != null) {
      return Positioned(top: MediaQuery.paddingOf(context).top + 8, left: 12, right: 12,
        child: Material(elevation: 12, color: const Color(0xFF1E1E2A), borderRadius: BorderRadius.circular(16),
          child: ListTile(onTap: calls.expandLegacy,
            title: Text(legacy.peerName, style: const TextStyle(color: Colors.white)),
            subtitle: const Text('Call in progress · Tap to expand', style: TextStyle(color: Colors.white70)),
            trailing: IconButton(tooltip: 'End call', icon: const Icon(Icons.call_end, color: Colors.redAccent), onPressed: legacy.hangUp),
          ),
        ),
      );
    }
    if (!h.showMini) return const SizedBox.shrink();
    final e = h.engine!;
    final size = MediaQuery.sizeOf(context);
    final pad = MediaQuery.paddingOf(context);
    const w = 232.0, ht = 62.0;
    _pos ??= Offset(size.width - w - 12, pad.top + 72);
    final x = _pos!.dx.clamp(8.0, size.width - w - 8).toDouble();
    final y = _pos!.dy.clamp(pad.top + 8, size.height - ht - pad.bottom - 8).toDouble();
    final name = (h.title == null || h.title!.isEmpty) ? (h.audioOnly ? 'Audio call' : 'Video call') : h.title!;
    return Positioned(
      left: x,
      top: y,
      width: w,
      height: ht,
      child: GestureDetector(
        onPanUpdate: (d) => setState(() => _pos = Offset(x + d.delta.dx, y + d.delta.dy)),
        child: Material(
          elevation: 12,
          color: const Color(0xFF1E1E2A),
          borderRadius: BorderRadius.circular(31),
          child: InkWell(
            borderRadius: BorderRadius.circular(31),
            onTap: h.expand,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(14, 0, 8, 0),
              child: Row(children: [
                Icon(h.audioOnly ? Icons.call_rounded : Icons.videocam_rounded, color: Colors.greenAccent, size: 22),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text(name, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(color: Colors.white, fontSize: 12.5, fontWeight: FontWeight.w700, decoration: TextDecoration.none)),
                    Row(children: [
                      Text(_elapsed(), style: const TextStyle(color: Colors.greenAccent, fontSize: 11.5, fontWeight: FontWeight.w500, decoration: TextDecoration.none)),
                      if (e.recRunning && e.recUi['icon'] == true) const Padding(
                        padding: EdgeInsets.only(left: 8),
                        child: Text('● REC', style: TextStyle(color: Colors.redAccent, fontSize: 11, fontWeight: FontWeight.w800, decoration: TextDecoration.none)),
                      ),
                    ]),
                  ]),
                ),
                _btn(e.micOn ? Icons.mic_rounded : Icons.mic_off_rounded, h.toggleMute, off: !e.micOn),
                const SizedBox(width: 6),
                _btn(Icons.call_end_rounded, h.endNow, danger: true),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
