import 'package:fadi_bring_me_app/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: const Scaffold(
        backgroundColor: Colors.lightGreen,
        body: HomeScreen(),
      ),
    );
  }
}
