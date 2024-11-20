import 'package:flutter/material.dart';

final textInputDecoration = InputDecoration(
  fillColor: const Color.fromARGB(255, 228, 222, 220),
  filled: true,
  contentPadding: const EdgeInsets.all(10.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: const BorderSide(color: Colors.white, width: 2.0),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(color: Colors.brown[400]!, width: 2.0),
  ),
);
