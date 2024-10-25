import 'package:flutter/material.dart';

class SteckBriefWidget extends StatelessWidget {
  const SteckBriefWidget({
    super.key,
    required this.image,
    required this.title,
  });

  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(width: 70),
          Container(height: 70, width: 70, child: Image.asset(image)),
          const SizedBox(
            width: 40,
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium,
            //style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
