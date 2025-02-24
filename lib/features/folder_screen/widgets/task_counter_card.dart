import 'package:flutter/material.dart';

class TaskCounterCard extends StatefulWidget {
  final int taskCount;
  final String taskText; // Neue Eigenschaft

  const TaskCounterCard(
      {super.key, required this.taskText, required this.taskCount});

  @override
  State<TaskCounterCard> createState() => _TaskCounterCardState();
}

class _TaskCounterCardState extends State<TaskCounterCard> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          // Text(
          //   "${widget.taskCount}",
          //   style: const TextStyle(
          //     fontSize: 36,
          //     color: Colors.white,
          //     fontWeight: FontWeight.bold,
          //   ),
          // ),
          // const SizedBox(width: 16),

          // const ListTile(
          //   title: Text("data"),
          //   subtitle: Text("Datein"),
          //   leading: Icon(Icons.sd_card_alert_outlined),
          // ),

          Text(
            widget.taskText, // Zeige den Text an
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}
