import 'dart:developer';

import 'package:fadi_bring_me_app/config/colors.dart';
import 'package:fadi_bring_me_app/database/repository/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginButton extends StatefulWidget {
  const LoginButton({
    super.key,
    required this.contHeight,
    required this.contWidth,
    required this.emailController,
    required this.passwordController,
  });

  final double contHeight;
  final double contWidth;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  Future<void> login() async {
    final authRepo = Provider.of<AuthRepo>(context, listen: false);
    final email = widget.emailController.text.trim();
    final password = widget.passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Bitte alle Felder ausfüllen.")),
      );
      return;
    }

    try {
      await authRepo.signInWithEmailAndPassword(email, password);
      if (!mounted) return;
      Navigator.pushNamed(context, "/bottomnavigationbarmain");
    } catch (e) {
      log("Fehler beim Login: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: login,
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
          child: Text("Anmelden",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
