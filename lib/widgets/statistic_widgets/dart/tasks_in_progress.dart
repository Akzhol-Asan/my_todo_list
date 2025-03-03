import 'package:flutter/material.dart';
import 'package:home_work_1/widgets/statistics/statistics_card.dart';
import '../../../models/task.dart';

class TasksInProgress extends StatelessWidget {
  final List<Task> tasks;

  const TasksInProgress({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    final tasksInProgress = tasks.where((task) => !task.isDone).toList();
    print(tasksInProgress);

    return StatisticsCard(
      color: Colors.green.shade200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Tasks in Progress'),
          Text('${tasksInProgress.length}'),
        ],
      ),
    );
  }
}
