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

Widget continueWith(
    {required facebook,
    required google,
    required toggle,
    required String regOrLogin,
    required String alreadyOrDont}) {
  Divider divider() {
    return const Divider(
      color: Colors.grey,
      thickness: 2.0,
      indent: 16.0,
      endIndent: 16.0,
    );
  }

  return Column(
    children: [
      Row(
        children: [
          Expanded(child: divider()),
          const Text('or continue with'),
          Expanded(child: divider()),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: facebook,
            child: Image.asset(
              'assets/signin/facebook.png',
              width: 50,
              height: 50,
            ),
          ),
          InkWell(
            onTap: google,
            child: Image.asset(
              'assets/signin/google.png',
              width: 50,
              height: 50,
            ),
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('$alreadyOrDont have an account?'),
          TextButton(
            onPressed: toggle, // Correctly invoking the toggle function
            child: Text(
              regOrLogin,
              style: TextStyle(
                color: Colors.blue[500], decoration: TextDecoration.underline,
                decorationColor: Colors.blue[500], // Custom underline color
                decorationThickness: 2,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    ],
  );
}
