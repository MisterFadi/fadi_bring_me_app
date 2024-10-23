import 'package:flutter/material.dart';

class OderDeviderWidget extends StatelessWidget {
  const OderDeviderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(child: Divider(thickness: 1)),
        Center(
          child: Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Text(
              "oder",
              style: TextStyle(fontSize: 15),
            ),
          ),
        ),
        Expanded(child: Divider(thickness: 1)),
      ],
    );
  }
}
