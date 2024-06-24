import 'package:flutter/material.dart';

class GlobalThemData {
  static final Color _focusColor = Colors.black.withOpacity(0.12);

  static ThemeData appThemeData = themeData(_colorScheme, _focusColor);

  static ThemeData themeData(ColorScheme colorScheme, Color focusColor) {
    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      canvasColor: colorScheme.surface,
      scaffoldBackgroundColor: colorScheme.surface,
      highlightColor: colorScheme.primary,
      focusColor: focusColor,
      appBarTheme: const AppBarTheme(
          color: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 18)),
    );
  }

  static const ColorScheme _colorScheme = ColorScheme(
    primary: Color(0xFFB93C5D),
    onPrimary: Colors.white,
    secondary: Color(0xFFEFF3F3),
    onSecondary: Color(0xFF322942),
    error: Colors.redAccent,
    onError: Colors.white,
    surface: Color(0xFFF9F4F2),
    onSurface: Color(0xFF241E30),
    brightness: Brightness.light,
  );
}

ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    textTheme: const TextTheme(
      displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
      bodyLarge: TextStyle(fontSize: 18, color: Colors.black87),
    ),
    appBarTheme: const AppBarTheme(
      color: Colors.white,
      iconTheme: IconThemeData(color: Colors.black),
    ),
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
    scaffoldBackgroundColor: const Color(0xFFB93C5D));
