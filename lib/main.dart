import 'package:fadi_bring_me_app/config/themes.dart';
import 'package:fadi_bring_me_app/database/mock_database.dart';
import 'package:fadi_bring_me_app/database/repository/database_repository.dart';
import 'package:fadi_bring_me_app/features/home_screen/screen/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  final repository = MockDatabase();

  runApp(MainApp(repository: repository));
}

class MainApp extends StatelessWidget {
  MainApp({super.key, required DatabaseRepository repository});

  final DatabaseRepository repository = MockDatabase();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: myTheme,
      home: Scaffold(
        backgroundColor: Colors.green,
        body: HomeScreen(repository: repository),
      ),
    );
  }
}
