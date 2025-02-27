import 'package:flutter/material.dart';
import 'package:home_work_1/widgets/task_card.dart';
import '../models/task.dart';

class TasksScreen extends StatelessWidget {
  final List<Task> tasks;

  const TasksScreen({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: tasks.map((task) => TaskCard(task: task)).toList(),
      ),
    );
  }
}
