import 'package:flutter/material.dart';

class OderDeviderWidget extends StatelessWidget {
  const OderDeviderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 30),
        const Expanded(
          child: Divider(thickness: 1),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Text(
              "oder",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ),
        const Expanded(
          child: Divider(thickness: 1),
        ),
        const SizedBox(width: 30),
      ],
    );
  }
}
