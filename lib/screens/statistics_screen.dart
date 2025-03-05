import 'package:flutter/material.dart';
import 'package:home_work_1/widgets/statistic_widgets/dart/tasks_in_progress.dart';
import 'package:home_work_1/widgets/statistics/statistics_container.dart';
import 'package:home_work_1/widgets/statistic_widgets/dart/tasks_chart.dart';
import 'package:home_work_1/widgets/statistic_widgets/dart/total_tasks_amount.dart';
import '../models/task.dart';
import '../widgets/statistic_widgets/dart/categories_summary.dart';
import '../widgets/statistic_widgets/dart/done_tasks_amount.dart';

class StatisticsScreen extends StatelessWidget {
  final List<Task> tasks;
  const StatisticsScreen({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 15),
      child: StatisticsContainer(
        child: Column(
          children: [
            TotalTasksAmount(tasks: tasks),
            TasksInProgress(tasks: tasks),
            CategoriesSummary(tasks: tasks),
            TasksChart(tasks: tasks),
            Text(
              'Кол-во выполненных задач пока не сохраняется так как при переключении страниц состояние isDone обновляется*\nЗадачи #1, #6, #7 имеют статус Done для демонстрации',
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
            DoneTasksAmount(tasks: tasks),
          ],
        ),
      ),
    );
  }
}
