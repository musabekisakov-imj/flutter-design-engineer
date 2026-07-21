import 'package:flutter/material.dart';

const ink = Color(0xFF102235);
const coral = Color(0xFFE7654B);
const canvas = Color(0xFFF8F4EC);
const surface = Color(0xFFFFFCF7);
const outline = Color(0xFFDDD5C8);
const muted = Color(0xFF6D6A64);
const amber = Color(0xFFF2C85B);
const blue = Color(0xFF5D78EE);
const green = Color(0xFF8BC7A1);

ThemeData buildDemoTheme() {
  final scheme = ColorScheme.fromSeed(
    seedColor: ink,
    brightness: Brightness.light,
    surface: canvas,
  ).copyWith(primary: ink, secondary: coral, surface: canvas, outline: outline);

  return ThemeData(
    useMaterial3: true,
    colorScheme: scheme,
    scaffoldBackgroundColor: ink,
    fontFamily: 'DemoRoboto',
    textTheme: const TextTheme(
      displaySmall: TextStyle(
        fontSize: 38,
        height: 1.04,
        fontWeight: FontWeight.w800,
        color: ink,
      ),
      headlineMedium: TextStyle(
        fontSize: 25,
        height: 1.12,
        fontWeight: FontWeight.w800,
        color: ink,
      ),
      titleMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: ink,
      ),
      bodyLarge: TextStyle(fontSize: 16, height: 1.4, color: ink),
      bodyMedium: TextStyle(fontSize: 14, height: 1.4, color: muted),
      labelLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        minimumSize: const Size.fromHeight(52),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: coral,
      linearTrackColor: outline,
    ),
  );
}
