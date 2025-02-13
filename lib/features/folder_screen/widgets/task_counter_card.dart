import 'package:flutter/material.dart';

class TaskCounterCard extends StatelessWidget {
  final int taskCount;

  const TaskCounterCard({super.key, required this.taskCount});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "$taskCount",
            style: const TextStyle(
              fontSize: 36,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 16),
          const Expanded(
            child: Text(
              "Kein Ordner vorhanden",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
