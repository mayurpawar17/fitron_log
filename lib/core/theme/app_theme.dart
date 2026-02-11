// app_theme.dart
import 'package:fitron_log/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  // Light Theme
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    // colorScheme: const ColorScheme.light(
    //   primary: Colors.blue,
    //   secondary: Colors.teal,
    //   background: Colors.white,
    //   surface: Colors.white,
    //   onPrimary: Colors.white,
    //   onSecondary: Colors.black,
    //   onBackground: Colors.black,
    //   onSurface: Colors.black,
    // ),
    scaffoldBackgroundColor: AppColors.primaryLightColor,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primaryLightColor,
      foregroundColor: Colors.black,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.black),
      bodyMedium: TextStyle(color: Colors.black87),
    ),
  );

  // Dark Theme
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      primary: Colors.deepPurple,
      secondary: Colors.pinkAccent,
      background: Colors.black,
      surface: Colors.black,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onBackground: Colors.white,
      onSurface: Colors.white,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.deepPurple,
      foregroundColor: Colors.white,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white),
      bodyMedium: TextStyle(color: Colors.white70),
    ),
  );
}
