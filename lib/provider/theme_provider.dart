import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// StateNotifier to manage theme mode
class ThemeNotifier extends StateNotifier<ThemeMode> {
  ThemeNotifier() : super(ThemeMode.light);

  void toggleTheme() {
    state = state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
  }
}

// Provider for ThemeNotifier
final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, ThemeMode>(
  (ref) => ThemeNotifier(),
);

final lightTheme = ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.red,
  appBarTheme: AppBarTheme(
    color: Colors.blue[200],
    foregroundColor: Colors.black, // Default AppBar text color
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor:
          Colors.black, // Default text color for TextButton in light mode
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.blue[100],
      foregroundColor: Colors.black,
    ),
  ),
);

final darkTheme = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.grey,
    appBarTheme: AppBarTheme(
      color: Colors.grey[900],
      foregroundColor: Colors.white, // Default AppBar text color
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor:
            Colors.white, // Default text color for TextButton in dark mode
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor:
            Colors.grey[800], // Background color for ElevatedButton
        foregroundColor: Colors.white, // Text color for ElevatedButton
      ),
    ));
