import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key, required this.language});
  final String language;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Image.asset(
                  "assets/logo/BringMe_Logo.png",
                  fit: BoxFit.cover,
                  width: 150,
                  height: 150,
                ),
              ),
              const SizedBox(height: 100),
              Text(language),
              const Divider(
                thickness: 3,
                height: 15,
                indent: 35,
                endIndent: 35,
                color: Color.fromARGB(100, 242, 232, 207),
              ),
              const Text(
                "Bitte Sprache auswählen",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              const Divider(
                thickness: 3,
                height: 15,
                indent: 35,
                endIndent: 35,
                color: Color.fromARGB(100, 242, 232, 207),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
