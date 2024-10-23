import 'package:flutter/material.dart';

class RichtlinienWidget extends StatelessWidget {
  const RichtlinienWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(
            "Indem du BringMe verwendest, stimmst du unseren Nutzungs- und Datenschutzbestimmungen zu.");
      },
      child: const Text(
        "Indem du BringMe verwendest, stimmst du unseren Nutzungs- und Datenschutzbestimmungen zu.",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 10,
        ),
      ),
    );
  }
}
