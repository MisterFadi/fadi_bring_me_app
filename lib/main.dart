import 'package:fadi_bring_me_app/config/themes.dart';
import 'package:fadi_bring_me_app/database/firebase/firebase_auth_repo.dart';
import 'package:fadi_bring_me_app/database/firebase/firebase_database_repo.dart';
import 'package:fadi_bring_me_app/database/repository/auth_repo.dart';
import 'package:fadi_bring_me_app/database/repository/database_repository.dart';
import 'package:fadi_bring_me_app/features/home_screen/screen/home_screen.dart';
import 'package:fadi_bring_me_app/features/list_screen/screen/list_screen.dart';
import 'package:fadi_bring_me_app/firebase_options.dart';
import 'package:fadi_bring_me_app/shared/bottom_nav_bar_widget.dart';
import 'package:fadi_bring_me_app/splash_screen/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

/*
void main({bool useMock = true}) async {
  WidgetsFlutterBinding.ensureInitialized();
  if (!useMock) {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
  // final repository = MockDatabase();
  runApp(
    MultiProvider(
      providers: [
        Provider<DatabaseRepository>(
          create: (_) =>
              useMock ? FirebaseDatabaseRepo() : SharedPreferencesDatabase(),
        ),
        Provider<AuthRepo>(
          create: (_) => useMock ? FirebaseAuthRepo() : SharedPreferencesAuth(),
        )
      ],
      child: const MainApp(),
    ),
  );
}
*/

void main() async {
  await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // final repository = MockDatabase();
  runApp(
    MultiProvider(
      providers: [
        Provider<DatabaseRepository>(create: (_) => FirebaseDatabaseRepo()),
        Provider<AuthRepo>(create: (_) => FirebaseAuthRepo())
      ],
      child: const MainApp(),
    ),
  );
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
    final authRepo = Provider.of<AuthRepo>(context, listen: false);
    return StreamBuilder<User?>(
      stream: authRepo.authStateChanges,
      builder: (context, snapshot) {
        final isLoggedIn = snapshot.data?.uid != null;

        return MaterialApp(
          key: ValueKey(isLoggedIn),
          theme: myTheme,
          debugShowCheckedModeBanner: false,
          initialRoute: "SplashScreen",
          routes: {
            "/listscreen": (context) => const ListScreen(),
            "SplashScreen": (context) => const SplashScreen(),
            "/home": (context) => const Scaffold(
                  body: HomeScreen(),
                ),
          },
          onGenerateRoute: (settings) {
            if (settings.name == '/bottomnavigationbarmain') {
              return MaterialPageRoute(
                  builder: (context) => const BottomNavBarWidget());
            }

            return MaterialPageRoute(
                builder: (context) => isLoggedIn
                    ? const BottomNavBarWidget()
                    : const HomeScreen());
          },
          home: isLoggedIn ? const BottomNavBarWidget() : const HomeScreen(),
        );
      },
    );
  }
}
