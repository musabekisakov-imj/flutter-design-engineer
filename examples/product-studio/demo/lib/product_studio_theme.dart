import 'package:flutter/material.dart';

const studioPaper = Color(0xFFF6F6F3);
const studioSurface = Color(0xFFFFFFFF);
const studioInk = Color(0xFF121921);
const studioBlue = Color(0xFF6D8CFF);
const studioLime = Color(0xFFD9FF67);
const studioCoral = Color(0xFFFF715F);
const studioDivider = Color(0xFFDFE2E6);
const studioMuted = Color(0xFF626A74);
const studioSoft = Color(0xFFE9ECF1);

@immutable
class StudioColors extends ThemeExtension<StudioColors> {
  const StudioColors({
    required this.paper,
    required this.ink,
    required this.ai,
    required this.verified,
    required this.critical,
  });

  final Color paper;
  final Color ink;
  final Color ai;
  final Color verified;
  final Color critical;

  @override
  StudioColors copyWith({
    Color? paper,
    Color? ink,
    Color? ai,
    Color? verified,
    Color? critical,
  }) => StudioColors(
    paper: paper ?? this.paper,
    ink: ink ?? this.ink,
    ai: ai ?? this.ai,
    verified: verified ?? this.verified,
    critical: critical ?? this.critical,
  );

  @override
  StudioColors lerp(StudioColors? other, double t) {
    if (other == null) return this;
    return StudioColors(
      paper: Color.lerp(paper, other.paper, t)!,
      ink: Color.lerp(ink, other.ink, t)!,
      ai: Color.lerp(ai, other.ai, t)!,
      verified: Color.lerp(verified, other.verified, t)!,
      critical: Color.lerp(critical, other.critical, t)!,
    );
  }
}

ThemeData buildProductStudioTheme() {
  final scheme =
      ColorScheme.fromSeed(
        seedColor: studioBlue,
        brightness: Brightness.light,
        surface: studioSurface,
      ).copyWith(
        primary: studioBlue,
        onPrimary: studioInk,
        secondary: studioLime,
        onSecondary: studioInk,
        error: studioCoral,
        onError: studioInk,
        surface: studioSurface,
        onSurface: studioInk,
        outline: studioDivider,
      );

  return ThemeData(
    useMaterial3: true,
    colorScheme: scheme,
    scaffoldBackgroundColor: studioPaper,
    fontFamily: 'Roboto',
    extensions: const [
      StudioColors(
        paper: studioPaper,
        ink: studioInk,
        ai: studioBlue,
        verified: studioLime,
        critical: studioCoral,
      ),
    ],
    textTheme: const TextTheme(
      displaySmall: TextStyle(
        fontSize: 38,
        height: 1.02,
        letterSpacing: -1.5,
        fontWeight: FontWeight.w700,
        color: studioInk,
      ),
      headlineSmall: TextStyle(
        fontSize: 24,
        height: 1.08,
        letterSpacing: -0.7,
        fontWeight: FontWeight.w700,
        color: studioInk,
      ),
      titleMedium: TextStyle(
        fontSize: 16,
        height: 1.25,
        fontWeight: FontWeight.w700,
        color: studioInk,
      ),
      bodyLarge: TextStyle(fontSize: 16, height: 1.4, color: studioInk),
      bodyMedium: TextStyle(fontSize: 14, height: 1.4, color: studioMuted),
      labelLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
    ),
    dividerColor: studioDivider,
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: studioLime,
      linearTrackColor: Color(0xFF3C444D),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: studioBlue,
        foregroundColor: studioInk,
        minimumSize: const Size.fromHeight(52),
        textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
    ),
  );
}
