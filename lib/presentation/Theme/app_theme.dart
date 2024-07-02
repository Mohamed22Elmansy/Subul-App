import 'package:flutter/material.dart';

enum AppTheme {
  lightMode("Light Mode"),
  darkMode("Dark Mode");

  const AppTheme(this.name);
  final String name;
}

final appThemeData = {
  AppTheme.darkMode: ThemeData(
    scaffoldBackgroundColor: const Color.fromRGBO(33, 34, 45, 1),
    primaryColor: Colors.white,
    
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontFamily: 'Tajawal',
        fontWeight: FontWeight.bold,
        fontSize: 36,
        color: Color.fromARGB(255, 244, 241, 241),
      ),
    ),
    // iconTheme: const IconThemeData(color: Colors.grey),
    fontFamily: 'Tajawal',
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        iconColor: WidgetStateProperty.all(Colors.grey),
      ),
    ),
    useMaterial3: true,
  ),
  AppTheme.lightMode: ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.black,
    primaryIconTheme: const IconThemeData(color: Colors.black),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontFamily: 'Tajawal',
        fontWeight: FontWeight.bold,
        fontSize: 36,
        color: Color.fromRGBO(52, 61, 64, 1),
        // fontSize: 50,
      ),
      displayMedium: TextStyle(
        fontFamily: 'Tajawal',
      ),
    ),
    scaffoldBackgroundColor: const Color.fromRGBO(244, 244, 244, 1),
    useMaterial3: true,
  ),
};
