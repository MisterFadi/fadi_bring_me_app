import 'package:flutter/material.dart';

class LogoutButton extends StatefulWidget {
  const LogoutButton({
    super.key,
    required this.text,
    required this.onPressed,
  });
  final String text;
  final VoidCallback onPressed;
  @override
  State<LogoutButton> createState() => _LogoutButtonState();
}

class _LogoutButtonState extends State<LogoutButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 15),
      ),
      child: Text(
        widget.text,
        style: const TextStyle(
          color: Color.fromARGB(255, 45, 25, 7),
          fontWeight: FontWeight.w600,
          fontSize: 14,
          fontStyle: FontStyle.normal,
          fontFamily: "SFProDisplay",
        ),
      ),
    );
  }
}
