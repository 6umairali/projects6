import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/api.dart';
import 'core/android_callkit.dart';
import 'core/app_lock.dart';
import 'core/config.dart';
import 'core/conversation_visibility.dart';
import 'core/device_env.dart';
import 'core/push.dart';
import 'core/room_host.dart';
import 'core/nav.dart';
import 'core/notify.dart';
import 'core/prefs.dart';
import 'core/session.dart';
import 'core/theme.dart';
import 'screens/lock_screen.dart';
import 'screens/login_screen.dart';
import 'screens/splash_screen.dart';
import 'shell/app_shell.dart';

/// Keeps the native launch screen (logo + name + tagline) on screen until the app is READY, then lets the first frame
/// through – so there is exactly one splash and no second in-app splash screen.
class AppBoot {
  static bool _held = false, _scheduled = false;
  static DateTime _start = DateTime.now();

  static void hold() {
    WidgetsBinding.instance.deferFirstFrame();
    _held = true;
    _start = DateTime.now();
  }

  /// Lets the first frame through – but never before [AppConfig.splashMinMs] have passed since launch.
  static void release({bool force = false}) {
    if (!_held) return;
    if (force) return _go();
    final wait = AppConfig.splashMinMs - DateTime.now().difference(_start).inMilliseconds;
    if (wait <= 0) return _go();
    if (_scheduled) return;
    _scheduled = true;
    Timer(Duration(milliseconds: wait), _go);
  }

  static void _go() {
    if (!_held) return;
    _held = false;
    WidgetsBinding.instance.allowFirstFrame();
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(firebaseBackgroundHandler); // pushes while the app is closed
  await AndroidCallKit.init();
  await DeviceEnv.timezone(); // read the phone's timezone before the first request is made
  AppBoot.hold();
  Timer(const Duration(milliseconds: 3500), () => AppBoot.release(force: true)); // safety net (Android's own limit is 4 s)
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => Session()..restore()),
      ChangeNotifierProvider(create: (_) => AppPrefs()..load()),
      ChangeNotifierProvider(create: (_) => AppLock()..load()),
    ],
    child: const DahiMailApp(),
  ));
}

class DahiMailApp extends StatelessWidget {
  const DahiMailApp({super.key});

  @override
  Widget build(BuildContext context) {
    final mode = context.select<AppPrefs, ThemeMode>((p) => p.themeMode);
    return MaterialApp(
      title: AppConfig.appName,
      debugShowCheckedModeBanner: false,
      navigatorKey: rootNavKey,
      navigatorObservers: [conversationRoutes],
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: mode,
      scrollBehavior: const AppScrollBehavior(),
      // Respect the user's font-size setting (accessibility) but stop extreme values from breaking layouts.
      builder: (context, child) => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaler: MediaQuery.textScalerOf(context).clamp(minScaleFactor: 0.85, maxScaleFactor: 1.35)),
        child: _SecurityLayer(child: child ?? const SizedBox.shrink()),
      ),
      home: const _Gate(),
    );
  }
}

/// Sits above the whole app: the PIN lock screen and the "recent apps" privacy cover.
class _SecurityLayer extends StatefulWidget {
  final Widget child;
  const _SecurityLayer({required this.child});
  @override
  State<_SecurityLayer> createState() => _SecurityLayerState();
}

class _SecurityLayerState extends State<_SecurityLayer> {
  @override
  void initState() {
    super.initState();
    // 10 wrong PINs → sign out (protects the account if the phone is stolen).
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final lock = context.read<AppLock>();
      final session = context.read<Session>();
      lock.onTooManyAttempts = () async {
        await lock.disable();
        await session.signOut();
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    final lock = context.watch<AppLock>();
    final signedIn = context.select<Session, bool>((s) => s.isLoggedIn);
    final showLock = signedIn && lock.enabled && lock.locked;
    final showCover = signedIn && lock.enabled && lock.cover && !showLock;
    return Stack(textDirection: TextDirection.ltr, children: [
      widget.child,
      const MiniCallOverlay(), // small call window while a call / meeting is minimized
      if (showLock) const Positioned.fill(child: LockScreen()),
      if (showCover) const Positioned.fill(child: PrivacyCover()),
    ]);
  }
}

class _Gate extends StatefulWidget {
  const _Gate();
  @override
  State<_Gate> createState() => _GateState();
}

class _GateState extends State<_Gate> with WidgetsBindingObserver {
  bool _cacheReady = false;
  String? _cacheUser;
  Timer? _t;

  @override
  void initState() {
    super.initState();
    NotifyService.I.init();
    WidgetsBinding.instance.addObserver(this);
    // Permissions are NOT asked here any more. They are asked in context: notifications right after the first sign-in
    // (AppShell), microphone / camera / contacts when a feature needs them (see core/app_permissions.dart).
  }

  /// The user may change the phone's timezone (travel) while the app is in the background → re-read it on return.
  @override
  void didChangeAppLifecycleState(AppLifecycleState s) {
    if (s == AppLifecycleState.resumed) DeviceEnv.timezone();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _t?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final s = context.watch<Session>();
    final prefs = context.watch<AppPrefs>();
    final lock = context.watch<AppLock>();
    // No artificial minimum: the native launch screen flows straight into this one, then into the app as soon as data is ready.
    if (!s.ready || !prefs.ready || !lock.ready) return const SplashScreen(); // (normally never drawn: the native launch screen is still showing)
    if (s.isLoggedIn) {
      // Load last session's saved data BEFORE the first screen builds, so screens open instantly with content.
      final key = '${s.userId}';
      if (_cacheUser != key) {
        _cacheUser = key;
        _cacheReady = false;
        Api.initCache(key).whenComplete(() {
          if (mounted) setState(() => _cacheReady = true);
        });
      }
      if (!_cacheReady) return const SplashScreen();
    } else {
      _cacheUser = null;
      _cacheReady = false;
    }
    // Everything needed for the first real screen is loaded → let the first frame through (native splash → app directly).
    Future.microtask(AppBoot.release);
    if (!s.isLoggedIn) {
      // Signed out: the keystore was wiped, so drop the in-memory lock state and this device's notification history.
      WidgetsBinding.instance.addPostFrameCallback((_) {
        lock.onSignedOut();
        prefs.resetNotificationHistory();
        NotifyService.I.clearAll();
      });
      return const LoginScreen();
    }
    return const AppShell();
  }
}


/// Lists are always "pullable": pull-to-refresh also works when the content is shorter than the screen
/// (it silently did nothing on short lists before).
class AppScrollBehavior extends MaterialScrollBehavior {
  const AppScrollBehavior();
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) => AlwaysScrollableScrollPhysics(parent: super.getScrollPhysics(context));
}
