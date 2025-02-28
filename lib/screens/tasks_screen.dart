import 'package:flutter/material.dart';
import 'package:home_work_1/widgets/task_card.dart';
import '../models/task.dart';

class TasksScreen extends StatefulWidget {
  final List<Task> tasks;

  const TasksScreen({super.key, required this.tasks});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: widget.tasks.map((task) => TaskCard(task: task)).toList(),
        ),
      ),
    );
  }
}
