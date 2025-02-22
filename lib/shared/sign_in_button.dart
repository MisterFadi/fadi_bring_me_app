import 'dart:developer' as dev;

import 'package:fadi_bring_me_app/config/colors.dart';
import 'package:fadi_bring_me_app/features/authentification/screens/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInButton extends StatefulWidget {
  const SignInButton({
    super.key,
    required this.contHeight,
    required this.contWidth,
    required this.emailController,
    required this.passwordController,
    required this.onPressed,
  });

  final double contHeight;
  final double contWidth;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  final Function() onPressed;

  @override
  State<SignInButton> createState() => _SignInButtonState();
}

class _SignInButtonState extends State<SignInButton> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> login() async {
    final authRepo = Provider.of<AuthRepository>(context, listen: false);
    try {
      await authRepo.signInWithEmailAndPassword(
        emailController.text.trim(),
        passwordController.text.trim(),
      );
      Navigator.pushNamed(context, "/listscreen");
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Login fehlgeschlagen: ${e.toString()}")),
      );
      dev.log("Fehler beim Login: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Container(
        height: widget.contHeight,
        width: widget.contWidth,
        decoration: BoxDecoration(
          border: Border.all(width: 0),
          boxShadow: [
            BoxShadow(
              color: appColor,
            ),
          ],
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Center(
          child: Text("Registrieren",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
