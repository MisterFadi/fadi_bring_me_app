import 'package:flutter/material.dart';

class TaskCounterCard extends StatefulWidget {
  final int taskCount;

  const TaskCounterCard({super.key, required this.taskCount});

  @override
  State<TaskCounterCard> createState() => _TaskCounterCardState();
}

class _TaskCounterCardState extends State<TaskCounterCard> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /*
          Text(
            "$taskCount",
            style: const TextStyle(
              fontSize: 36,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            */

          SizedBox(width: 16),
        ],
      ),
    );
  }
}
