import 'package:flutter/material.dart';
import 'package:home_work_1/widgets/statistics/statistics_card.dart';

import '../../../models/task.dart';

class TotalTasksAmount extends StatelessWidget {
  final List<Task> tasks;
  const TotalTasksAmount({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return StatisticsCard(
        color: Colors.blue.shade200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Total tasks amount', style: textTheme.titleMedium),
            SizedBox(height: 8),
            Text('${tasks.length}', style: textTheme.displaySmall),
          ],
        ));
  }
}
