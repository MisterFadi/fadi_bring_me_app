import 'dart:developer' as dev;

import 'package:fadi_bring_me_app/database/repository/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AnmeldeButton extends StatefulWidget {
  const AnmeldeButton({
    super.key,
    required this.contHeight,
    required this.contWidth,
  });
  final double contHeight;
  final double contWidth;

  @override
  State<AnmeldeButton> createState() => _AnmeldeButtonState();
}

class _AnmeldeButtonState extends State<AnmeldeButton> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> login() async {
    final authRepo = Provider.of<AuthRepo>(context, listen: false);
    try {
      await authRepo.signInWithEmailAndPassword(
        emailController.text.trim(),
        passwordController.text.trim(),
      );
      // ignore: use_build_context_synchronously
      Navigator.pushNamed(context, "/bottomnavigationbarmain");
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Login fehlgeschlagen: ${e.toString()}")),
      );

      dev.log("Fehler beim Login: $e");
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
          border: Border.all(width: 0.5),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(255, 242, 232, 207),
            ),
          ],
          borderRadius: BorderRadius.circular(9),
        ),
        child: const Center(
          child: Text("Anmelden",
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
