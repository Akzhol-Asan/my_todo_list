import 'package:flutter/material.dart';
import 'package:home_work_1/widgets/statistics/statistics_card.dart';

import '../../../models/task.dart';

class DoneTasksAmount extends StatelessWidget {
  final List<Task> tasks;

  const DoneTasksAmount({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    final doneTasksAmount = tasks.where((task) => task.isDone).length;

    return StatisticsCard(
      color: Colors.purple.shade200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Done Tasks amount'),
          Text('$doneTasksAmount'),
        ],
      ),
    );
  }
}
