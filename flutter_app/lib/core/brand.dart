import 'package:flutter/material.dart';
import 'config.dart';
import 'theme.dart';

/// Single place for brand identity. To rebrand: replace the PNGs in assets/brand + assets/icon,
/// run `dart run flutter_launcher_icons`, and change the strings/colours here and in core/config.dart.
class Brand {
  static String get name => AppConfig.appName;
  static String get tagline => AppConfig.tagline;
  static const logoAsset = 'assets/brand/logo.png'; // full-colour app icon (rounded square)
  static const markAsset = 'assets/brand/mark_white.png'; // white symbol on transparent, for coloured backgrounds
  /// Must equal `splash_bg` in android/app/src/main/res/values/colors.xml (white).
  static const splashColor = Color(0xFFFFFFFF);
  static const splashGradient = LinearGradient(colors: [Color(0xFFFFFFFF), Color(0xFFFFFFFF)], begin: Alignment.topLeft, end: Alignment.bottomRight);
  static const gradient = LinearGradient(colors: [Color(0xFF6D65E9), AppColors.primary], begin: Alignment.topLeft, end: Alignment.bottomRight);
}

/// The full-colour logo (rounded square).
class BrandLogo extends StatelessWidget {
  final double size;
  const BrandLogo({super.key, this.size = 84});
  @override
  Widget build(BuildContext context) => Semantics(
        label: '${Brand.name} logo',
        image: true,
        child: ClipRRect(borderRadius: BorderRadius.circular(size * 0.26), child: Image.asset(Brand.logoAsset, width: size, height: size, fit: BoxFit.cover, filterQuality: FilterQuality.high)),
      );
}

/// White symbol only – use on gradient / brand-coloured backgrounds (splash, lock screen).
class BrandMark extends StatelessWidget {
  final double size;
  const BrandMark({super.key, this.size = 96});
  @override
  Widget build(BuildContext context) => ExcludeSemantics(child: Image.asset(Brand.markAsset, width: size, height: size, filterQuality: FilterQuality.high));
}
