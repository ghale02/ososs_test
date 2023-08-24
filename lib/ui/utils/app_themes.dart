import 'package:flutter/material.dart';

class AppThemes {
  static ThemeData lightTheme() => ThemeData.light().copyWith(
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xff63b2f2),
        ),
        colorScheme: ColorScheme.light(
            primary: const Color(0xff63b2f2),
            secondary: const Color(0xff0d47a1),
            tertiaryContainer: Colors.grey.shade400,
            error: Colors.red),
        textTheme: const TextTheme(
            headlineMedium: TextStyle(
              color: Colors.black,
              fontSize: 17,
            ),
            labelMedium: TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
            displaySmall: TextStyle(fontSize: 13),
            titleMedium: TextStyle(color: Colors.black)),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            padding: const MaterialStatePropertyAll(EdgeInsets.all(12)),
            elevation: const MaterialStatePropertyAll(0),
          ),
        ),
      );
}
