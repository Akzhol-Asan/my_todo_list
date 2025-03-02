import 'package:flutter/material.dart';
import 'package:home_work_1/models/task_category.dart';
import 'package:home_work_1/widgets/task_card.dart';
import '../models/task.dart';

class TasksScreen extends StatefulWidget {
  final List<Task> tasks;
  final TaskCategory? selectedCategory;

  const TasksScreen({super.key, required this.tasks, this.selectedCategory});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  @override
  Widget build(BuildContext context) {
    final filteredTasks =
        widget.selectedCategory == null || widget.selectedCategory!.id == 'all'
            ? widget.tasks
            : widget.tasks
                .where((task) => task.categoryId == widget.selectedCategory!.id)
                .toList();

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8, bottom: 30),
        child: Column(
          children: filteredTasks.map((task) => TaskCard(task: task)).toList(),
        ),
      ),
    );
  }
}
