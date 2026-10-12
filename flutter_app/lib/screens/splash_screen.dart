import 'package:flutter/material.dart';
import '../core/brand.dart';
import '../core/theme.dart';

/// Fallback only. Normally you never see this: the native launch screen stays on screen until the app's first real
/// screen is ready. If a start is unusually slow this draws THE SAME picture (same colour, same logo + name, same
/// size and place), so there is still only one splash – a thin progress line appears after a moment.
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late final AnimationController _c = AnimationController(vsync: this, duration: const Duration(milliseconds: 1800))..forward();
  late final Animation<double> _bar = CurvedAnimation(parent: _c, curve: const Interval(0.6, 1.0, curve: Curves.easeOut));

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Brand.splashColor,
        body: Stack(children: [
          // 288 dp picture, exactly like the native splash symbol
          Center(child: Image.asset('assets/brand/splash_symbol.png', width: 288, height: 288, filterQuality: FilterQuality.high)),
          Align(
            alignment: const Alignment(0, 0.86),
            child: FadeTransition(
              opacity: _bar,
              child: SizedBox(width: 120, child: ClipRRect(borderRadius: BorderRadius.circular(4), child: LinearProgressIndicator(minHeight: 3, backgroundColor: AppColors.primary.withValues(alpha: 0.15), valueColor: const AlwaysStoppedAnimation(AppColors.primary)))),
            ),
          ),
        ]),
      );
}
