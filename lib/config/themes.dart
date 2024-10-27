import 'package:flutter/material.dart';

ThemeData myTheme = ThemeData(
    textTheme: const TextTheme(
        headlineLarge: TextStyle(
            fontSize: 30, color: Colors.white, fontWeight: FontWeight.normal),
        headlineMedium: TextStyle(
            fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),
        headlineSmall: TextStyle(
            fontSize: 18, color: Colors.blue, fontWeight: FontWeight.normal),
        bodyLarge: TextStyle(
            fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
        bodyMedium: TextStyle(fontSize: 16, color: Colors.black),
        bodySmall: TextStyle(fontSize: 14, color: Colors.white),
        displaySmall: TextStyle(
            fontSize: 10, color: Colors.black, fontWeight: FontWeight.normal)),
    appBarTheme: const AppBarTheme(
      color: Colors.green, // Background color for the AppBar in light mode
      titleTextStyle: TextStyle(
        color: Colors.grey, // AppBar title text color for light mode
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(color: Colors.black), // Icon color
    ),
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
    scaffoldBackgroundColor: Colors.green,
    navigationBarTheme:
        const NavigationBarThemeData(backgroundColor: Colors.green),
    fontFamily: "SFProDisplay");
