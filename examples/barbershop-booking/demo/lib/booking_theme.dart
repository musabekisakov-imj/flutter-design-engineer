import 'package:flutter/material.dart';

const bookingCanvas = Color(0xFFF2F3EF);
const bookingSurface = Color(0xFFFBFCF8);
const bookingMutedSurface = Color(0xFFE8EBE5);
const bookingInk = Color(0xFF161A1B);
const bookingMuted = Color(0xFF626A67);
const bookingLine = Color(0xFFCFD4CE);
const bookingAccent = Color(0xFFC24D32);
const bookingAccentSoft = Color(0xFFF3DED8);
const bookingSage = Color(0xFF48664A);
const bookingSageSoft = Color(0xFFDFE8DD);
const bookingDanger = Color(0xFFA3362E);

@immutable
class BookingTheme extends ThemeExtension<BookingTheme> {
  const BookingTheme({
    required this.canvas,
    required this.surface,
    required this.mutedSurface,
    required this.ink,
    required this.muted,
    required this.line,
    required this.accent,
    required this.accentSoft,
    required this.sage,
    required this.sageSoft,
    required this.danger,
  });

  const BookingTheme.light()
    : canvas = bookingCanvas,
      surface = bookingSurface,
      mutedSurface = bookingMutedSurface,
      ink = bookingInk,
      muted = bookingMuted,
      line = bookingLine,
      accent = bookingAccent,
      accentSoft = bookingAccentSoft,
      sage = bookingSage,
      sageSoft = bookingSageSoft,
      danger = bookingDanger;

  final Color canvas;
  final Color surface;
  final Color mutedSurface;
  final Color ink;
  final Color muted;
  final Color line;
  final Color accent;
  final Color accentSoft;
  final Color sage;
  final Color sageSoft;
  final Color danger;

  @override
  BookingTheme copyWith({
    Color? canvas,
    Color? surface,
    Color? mutedSurface,
    Color? ink,
    Color? muted,
    Color? line,
    Color? accent,
    Color? accentSoft,
    Color? sage,
    Color? sageSoft,
    Color? danger,
  }) {
    return BookingTheme(
      canvas: canvas ?? this.canvas,
      surface: surface ?? this.surface,
      mutedSurface: mutedSurface ?? this.mutedSurface,
      ink: ink ?? this.ink,
      muted: muted ?? this.muted,
      line: line ?? this.line,
      accent: accent ?? this.accent,
      accentSoft: accentSoft ?? this.accentSoft,
      sage: sage ?? this.sage,
      sageSoft: sageSoft ?? this.sageSoft,
      danger: danger ?? this.danger,
    );
  }

  @override
  BookingTheme lerp(covariant BookingTheme? other, double t) {
    if (other == null) return this;
    return BookingTheme(
      canvas: Color.lerp(canvas, other.canvas, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      mutedSurface: Color.lerp(mutedSurface, other.mutedSurface, t)!,
      ink: Color.lerp(ink, other.ink, t)!,
      muted: Color.lerp(muted, other.muted, t)!,
      line: Color.lerp(line, other.line, t)!,
      accent: Color.lerp(accent, other.accent, t)!,
      accentSoft: Color.lerp(accentSoft, other.accentSoft, t)!,
      sage: Color.lerp(sage, other.sage, t)!,
      sageSoft: Color.lerp(sageSoft, other.sageSoft, t)!,
      danger: Color.lerp(danger, other.danger, t)!,
    );
  }
}

extension BookingThemeContext on BuildContext {
  BookingTheme get bookingTheme => Theme.of(this).extension<BookingTheme>()!;
}

ThemeData buildBookingTheme() {
  const palette = BookingTheme.light();
  final scheme =
      ColorScheme.fromSeed(
        seedColor: palette.accent,
        brightness: Brightness.light,
        surface: palette.surface,
      ).copyWith(
        primary: palette.ink,
        secondary: palette.accent,
        error: palette.danger,
        outline: palette.line,
        surface: palette.surface,
      );

  final base = ThemeData(
    useMaterial3: true,
    colorScheme: scheme,
    fontFamily: 'DemoRoboto',
  );
  return base.copyWith(
    scaffoldBackgroundColor: palette.canvas,
    extensions: const [palette],
    textTheme: base.textTheme.copyWith(
      displaySmall: const TextStyle(
        fontFamily: 'BookingDisplay',
        fontSize: 42,
        height: 1.02,
        letterSpacing: -1.5,
        fontWeight: FontWeight.w500,
        color: bookingInk,
      ),
      headlineMedium: const TextStyle(
        fontFamily: 'BookingDisplay',
        fontSize: 31,
        height: 1.05,
        letterSpacing: -0.8,
        fontWeight: FontWeight.w500,
        color: bookingInk,
      ),
      titleLarge: const TextStyle(
        fontFamily: 'DemoRoboto',
        fontSize: 19,
        height: 1.2,
        fontWeight: FontWeight.w700,
        color: bookingInk,
      ),
      titleMedium: const TextStyle(
        fontFamily: 'DemoRoboto',
        fontSize: 15,
        height: 1.25,
        fontWeight: FontWeight.w700,
        color: bookingInk,
      ),
      bodyLarge: const TextStyle(
        fontFamily: 'DemoRoboto',
        fontSize: 16,
        height: 1.45,
        color: bookingInk,
      ),
      bodyMedium: const TextStyle(
        fontFamily: 'DemoRoboto',
        fontSize: 14,
        height: 1.42,
        color: bookingMuted,
      ),
      labelLarge: const TextStyle(
        fontFamily: 'DemoRoboto',
        fontSize: 14,
        fontWeight: FontWeight.w700,
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        minimumSize: const Size.fromHeight(54),
        foregroundColor: palette.surface,
        backgroundColor: palette.ink,
        disabledForegroundColor: palette.muted,
        disabledBackgroundColor: palette.mutedSurface,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(48, 48),
        foregroundColor: palette.ink,
        side: const BorderSide(color: bookingLine),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      labelStyle: const TextStyle(color: bookingMuted),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(9),
        borderSide: const BorderSide(color: bookingLine),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(9),
        borderSide: const BorderSide(color: bookingLine),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(9),
        borderSide: const BorderSide(color: bookingInk, width: 2),
      ),
    ),
  );
}
