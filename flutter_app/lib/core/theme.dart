import 'package:flutter/cupertino.dart' show CupertinoPageTransitionsBuilder;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// DahiMail design tokens (v2).
/// Principles: calm neutral surfaces, ONE accent (brand purple), hairline borders instead of shadows,
/// generous spacing, strong type hierarchy, WCAG AA text contrast.
class AppColors {
  // Brand
  static const primary = Color(0xFF4F46E5);
  static const primarySoft = Color(0xFFEDECFC); // tinted fills (light mode)
  static const primarySoftDark = Color(0xFF211E4A); // tinted fills (dark mode)
  static const primaryOnDark = Color(0xFFB0ACF3);

  // Neutrals – light
  static const bg = Color(0xFFF7F7FA);
  static const border = Color(0xFFE8E8EF);
  static const ink = Color(0xFF16151D);
  // Secondary text: 4.56:1 on white (AA) and 3.4–3.9:1 on the dark surfaces (readable; no single grey can pass 4.5 on both).
  static const muted = Color(0xFF706F86);

  // Neutrals – dark
  static const bgDark = Color(0xFF0F0E14);
  static const surfaceDark = Color(0xFF17161E);
  static const elevatedDark = Color(0xFF1F1E28);
  static const borderDark = Color(0xFF2A2935);

  // Semantic (fills) and their AA-safe text variants
  static const success = Color(0xFF0ACF83);
  static const successText = Color(0xFF057A4D);
  static const warn = Color(0xFFFF9800);
  static const warnText = Color(0xFF8A5300);
  static const danger = Color(0xFFD32F2F);
  static const info = Color(0xFF0087FF);
  static const infoText = Color(0xFF0B5FC0);

  static bool isDark(BuildContext c) => Theme.of(c).brightness == Brightness.dark;
  static Color borderOf(BuildContext c) => isDark(c) ? borderDark : border;
  static Color softOf(BuildContext c) => isDark(c) ? primarySoftDark : primarySoft;
  static Color accentOf(BuildContext c) => isDark(c) ? primaryOnDark : primary;
}

/// 4-pt spacing scale.
class Gap {
  static const xs = 4.0, s = 8.0, m = 12.0, l = 16.0, xl = 24.0, xxl = 32.0;
}

/// Corner radii.
class Rad {
  static const s = 8.0, m = 12.0, l = 16.0, xl = 24.0;
}

/// Screen-size breakpoints (Material 3 window size classes).
class Breakpoints {
  static const medium = 600.0;
  static const expanded = 900.0; // permanent side navigation
  static const maxContent = 1000.0;
}

class AppTheme {
  static ThemeData light() => _build(Brightness.light);
  static ThemeData dark() => _build(Brightness.dark);

  static ThemeData _build(Brightness b) {
    final dark = b == Brightness.dark;
    final surface = dark ? AppColors.surfaceDark : Colors.white;
    final line = dark ? AppColors.borderDark : AppColors.border;
    final onSurface = dark ? const Color(0xFFF2F1F8) : AppColors.ink;
    final scheme = ColorScheme.fromSeed(seedColor: AppColors.primary, brightness: b).copyWith(
      primary: dark ? AppColors.primaryOnDark : AppColors.primary,
      onPrimary: dark ? const Color(0xFF1B0F4D) : Colors.white,
      surface: surface,
      onSurface: onSurface,
      outline: line,
      outlineVariant: line,
      surfaceTint: Colors.transparent,
    );
    final base = ThemeData(useMaterial3: true, colorScheme: scheme, brightness: b);
    final shape12 = RoundedRectangleBorder(borderRadius: BorderRadius.circular(Rad.m));
    final tt = GoogleFonts.interTextTheme(base.textTheme).apply(bodyColor: onSurface, displayColor: onSurface);

    return base.copyWith(
      scaffoldBackgroundColor: dark ? AppColors.bgDark : AppColors.bg,
      // Type scale (Inter). Titles are semibold, body is 15/14, captions 12.5.
      textTheme: tt.copyWith(
        headlineMedium: tt.headlineMedium?.copyWith(fontSize: 28, fontWeight: FontWeight.w700, letterSpacing: -0.5),
        titleLarge: tt.titleLarge?.copyWith(fontSize: 20, fontWeight: FontWeight.w700, letterSpacing: -0.2),
        titleMedium: tt.titleMedium?.copyWith(fontSize: 15.5, fontWeight: FontWeight.w600),
        titleSmall: tt.titleSmall?.copyWith(fontSize: 14, fontWeight: FontWeight.w600),
        bodyLarge: tt.bodyLarge?.copyWith(fontSize: 15.5, height: 1.4),
        bodyMedium: tt.bodyMedium?.copyWith(fontSize: 14.5, height: 1.4),
        bodySmall: tt.bodySmall?.copyWith(fontSize: 12.5, height: 1.35),
        labelLarge: tt.labelLarge?.copyWith(fontSize: 14, fontWeight: FontWeight.w600),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: surface,
        surfaceTintColor: Colors.transparent,
        foregroundColor: onSurface,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        toolbarHeight: 56,
        shape: Border(bottom: BorderSide(color: line)),
        titleTextStyle: GoogleFonts.inter(fontSize: 19, fontWeight: FontWeight.w700, letterSpacing: -0.2, color: onSurface),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: dark ? AppColors.elevatedDark : Colors.white,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
        hintStyle: const TextStyle(color: AppColors.muted),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(Rad.m), borderSide: BorderSide(color: line)),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(Rad.m), borderSide: BorderSide(color: line)),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(Rad.m), borderSide: BorderSide(color: scheme.primary, width: 1.8)),
        errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(Rad.m), borderSide: const BorderSide(color: AppColors.danger)),
        focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(Rad.m), borderSide: const BorderSide(color: AppColors.danger, width: 1.8)),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          disabledBackgroundColor: AppColors.primary.withValues(alpha: 0.35),
          disabledForegroundColor: Colors.white70,
          minimumSize: const Size.fromHeight(52),
          shape: shape12,
          elevation: 0,
          textStyle: GoogleFonts.inter(fontSize: 15, fontWeight: FontWeight.w600),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(minimumSize: const Size(64, 48), shape: shape12, side: BorderSide(color: line), foregroundColor: scheme.primary, textStyle: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w600)),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(minimumSize: const Size(48, 44), shape: shape12, foregroundColor: scheme.primary, textStyle: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w600)),
      ),
      iconButtonTheme: IconButtonThemeData(style: IconButton.styleFrom(minimumSize: const Size(44, 44))),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        elevation: 2,
        highlightElevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Rad.l)),
        extendedTextStyle: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w600),
      ),
      navigationBarTheme: NavigationBarThemeData(
        height: 66,
        backgroundColor: surface,
        surfaceTintColor: Colors.transparent,
        shadowColor: Colors.transparent,
        elevation: 0,
        indicatorColor: dark ? AppColors.primarySoftDark : AppColors.primarySoft,
        indicatorShape: const StadiumBorder(),
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        labelTextStyle: WidgetStateProperty.resolveWith((s) => GoogleFonts.inter(fontSize: 12, fontWeight: s.contains(WidgetState.selected) ? FontWeight.w700 : FontWeight.w500, color: s.contains(WidgetState.selected) ? scheme.primary : AppColors.muted)),
        iconTheme: WidgetStateProperty.resolveWith((s) => IconThemeData(size: 24, color: s.contains(WidgetState.selected) ? scheme.primary : AppColors.muted)),
      ),
      navigationRailTheme: NavigationRailThemeData(
        backgroundColor: surface,
        indicatorColor: dark ? AppColors.primarySoftDark : AppColors.primarySoft,
        selectedIconTheme: IconThemeData(color: scheme.primary),
        unselectedIconTheme: const IconThemeData(color: AppColors.muted),
        selectedLabelTextStyle: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w700, color: scheme.primary),
        unselectedLabelTextStyle: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w500, color: AppColors.muted),
        labelType: NavigationRailLabelType.all,
      ),
      drawerTheme: DrawerThemeData(backgroundColor: surface, surfaceTintColor: Colors.transparent, width: 304),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: dark ? AppColors.elevatedDark : AppColors.ink,
        contentTextStyle: GoogleFonts.inter(fontSize: 14, color: Colors.white),
        shape: shape12,
        insetPadding: const EdgeInsets.all(16),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        showDragHandle: true,
        backgroundColor: surface,
        surfaceTintColor: Colors.transparent,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(Rad.xl))),
      ),
      dialogTheme: DialogThemeData(backgroundColor: surface, surfaceTintColor: Colors.transparent, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Rad.xl - 4))),
      dividerTheme: DividerThemeData(color: line, space: 1, thickness: 1),
      chipTheme: ChipThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(999)),
        side: BorderSide(color: line),
        backgroundColor: surface,
        selectedColor: dark ? AppColors.primarySoftDark : AppColors.primarySoft,
        labelStyle: GoogleFonts.inter(fontSize: 13, fontWeight: FontWeight.w500, color: onSurface),
      ),
      listTileTheme: ListTileThemeData(shape: shape12, minVerticalPadding: 6, iconColor: AppColors.muted),
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith((s) => s.contains(WidgetState.selected) ? Colors.white : (dark ? const Color(0xFFB8B7C9) : Colors.white)),
        trackColor: WidgetStateProperty.resolveWith((s) => s.contains(WidgetState.selected) ? AppColors.primary : (dark ? const Color(0xFF3A3948) : const Color(0xFFCFCEDB))),
        trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(color: scheme.primary),
      pageTransitionsTheme: const PageTransitionsTheme(builders: {
        TargetPlatform.android: PredictiveBackPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      }),
    );
  }
}

/// Card surface: hairline border, no shadow (flat, modern). Works in light and dark.
BoxDecoration cardDecoration(BuildContext c, {double radius = Rad.l}) {
  final dark = AppColors.isDark(c);
  return BoxDecoration(
    color: dark ? AppColors.surfaceDark : Colors.white,
    borderRadius: BorderRadius.circular(radius),
    border: Border.all(color: dark ? AppColors.borderDark : AppColors.border),
  );
}
