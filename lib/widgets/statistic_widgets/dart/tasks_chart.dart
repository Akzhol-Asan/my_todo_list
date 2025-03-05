import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:home_work_1/models/task.dart';
import 'package:home_work_1/widgets/statistics/statistics_card.dart';
import 'package:intl/intl.dart'; //

class TasksChart extends StatelessWidget {
  final List<Task> tasks;

  const TasksChart({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final last7Days = List.generate(
      7,
      (index) => DateTime(now.year, now.month, now.day - index),
    ).reversed.toList();

    final taskCounts = {
      for (var day in last7Days) DateFormat('dd.MM').format(day): 0
    };

    for (var task in tasks.where((t) => t.isDone && t.doneDate != null)) {
      final formattedDate = DateFormat('dd.MM').format(task.doneDate!);
      if (taskCounts.containsKey(formattedDate)) {
        taskCounts[formattedDate] = (taskCounts[formattedDate] ?? 0) + 1;
      }
    }

    return StatisticsCard(
      // color: Colors.black54,
      child: SizedBox(
        height: 220,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: BarChart(
            BarChartData(
              backgroundColor: Colors.black87,
              barTouchData: BarTouchData(
                enabled: true,
                touchTooltipData: BarTouchTooltipData(
                  tooltipPadding: EdgeInsets.zero,
                  tooltipMargin: 0,
                  getTooltipColor: (BarChartGroupData group) =>
                      Colors.transparent,
                ),
              ),
              titlesData: FlTitlesData(
                show: true,
                leftTitles:
                    AxisTitles(sideTitles: SideTitles(showTitles: false)),
                rightTitles:
                    AxisTitles(sideTitles: SideTitles(showTitles: false)),
                topTitles:
                    AxisTitles(sideTitles: SideTitles(showTitles: false)),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, meta) {
                      final index = value.toInt();
                      if (index >= 0 && index < last7Days.length) {
                        return Text(
                          taskCounts.keys.elementAt(index),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 12),
                        );
                      }
                      return const SizedBox.shrink();
                    },
                  ),
                ),
              ),
              borderData: FlBorderData(show: false),
              gridData: FlGridData(show: false),
              barGroups: List.generate(
                last7Days.length,
                (index) => BarChartGroupData(
                  x: index,
                  barRods: [
                    BarChartRodData(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(4),
                          topRight: Radius.circular(4)),
                      toY: (taskCounts.values.elementAt(index)).toDouble(),
                      width: 15,
                      color: Colors.lightGreenAccent,
                    ),
                  ],
                  showingTooltipIndicators: [0],
                ),
              ),
              minY: 0,
              maxY: (taskCounts.values.fold(0,
                          (prev, element) => prev > element ? prev : element) +
                      0.5)
                  .toDouble(),
            ),
          ),
        ),
      ),
    );
  }
}
