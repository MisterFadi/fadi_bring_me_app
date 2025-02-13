import 'package:fadi_bring_me_app/features/home_screen/screen/home_screen.dart';
import 'package:fadi_bring_me_app/shared/slide_from_bottom_page_route.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 5520), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          SlideFromBottomPageRoute(
            page: const HomeScreen(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown.shade100,
      body: const Center(
        child: Image(
          image: AssetImage("assets/gif/SplashScreen.gif"),
        ),
      ),
    );
  }
}
