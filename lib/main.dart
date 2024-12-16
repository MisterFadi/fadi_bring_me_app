import 'package:fadi_bring_me_app/config/themes.dart';
import 'package:fadi_bring_me_app/database/mock_database.dart';
import 'package:fadi_bring_me_app/database/repository/database_repository.dart';
import 'package:fadi_bring_me_app/features/home_screen/screen/home_screen.dart';
import 'package:fadi_bring_me_app/firebase_options.dart';
import 'package:fadi_bring_me_app/splash/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // final repository = MockDatabase();
  runApp(MultiProvider(providers: [
    Provider<DatabaseRepository>(
      create: (context) => MockDatabase(),
    )
  ], child: const MainApp()));
}

// void main() {
// final repository = MockDatabase();
// runApp(MainApp(repository: repository));
// }

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  // final DatabaseRepository repository = MockDatabase();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: myTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => const SplashScreen(),
        '/home': (context) => const Scaffold(
              body: HomeScreen(),
            ),
      },
      // home: Scaffold(
      //   backgroundColor: Colors.green,
      //   body: HomeScreen(repository: repository),
      // ),
    );
  }
}
