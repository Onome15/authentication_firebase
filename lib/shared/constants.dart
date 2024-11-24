import 'package:flutter/material.dart';

final textInputDecoration = InputDecoration(
  // fillColor: const Color.fromARGB(255, 228, 222, 220),
  filled: true,
  contentPadding: const EdgeInsets.all(10.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: const BorderSide(
        // color: Colors.white,
        width: 2.0),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: const BorderSide(
        // color: Colors.brown[400]!,
        width: 2.0),
  ),
);

Widget switchButton(themeMode, themeNotifier) {
  return IconButton(
    icon: Icon(
      themeMode == ThemeMode.dark ? Icons.nights_stay : Icons.wb_sunny,
      color: themeMode == ThemeMode.dark ? Colors.white : Colors.black,
    ),
    onPressed: () {
      themeNotifier.toggleTheme();
    },
    tooltip: 'Toggle Theme',
  );
}
