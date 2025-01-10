import 'package:flutter/material.dart';

class AbmeldenButton extends StatefulWidget {
  const AbmeldenButton({
    super.key,
    required this.text,
    required this.onPressed,
  });
  final String text;
  final VoidCallback onPressed;
  @override
  State<AbmeldenButton> createState() => _AbmeldenButtonState();
}

class _AbmeldenButtonState extends State<AbmeldenButton> {
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
