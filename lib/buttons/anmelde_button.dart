import 'package:fadi_bring_me_app/screens/list_screen.dart';
import 'package:flutter/material.dart';

class AnmeldeButton extends StatelessWidget {
  const AnmeldeButton({
    super.key,
    required this.contHeight,
    required this.contWidth,
  });
  final double contHeight;
  final double contWidth;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ListScreen()));
      },
      child: Container(
        height: contHeight,
        width: contWidth,
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
