import 'package:flutter/material.dart';
import 'package:home_work_1/widgets/statistics/statistics_card.dart';

class TasksChart extends StatelessWidget {
  const TasksChart({super.key});

  @override
  Widget build(BuildContext context) {
    return StatisticsCard(
      color: Colors.indigo.shade200,
      child: Text('Chart'),
    );
  }
}
