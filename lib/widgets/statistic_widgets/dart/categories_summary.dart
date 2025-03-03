import 'package:flutter/material.dart';
import 'package:home_work_1/data/categories_data.dart';
import 'package:home_work_1/widgets/category_display.dart';
import 'package:home_work_1/widgets/statistics/statistics_card.dart';
import 'package:home_work_1/models/task.dart';

class CategoriesSummary extends StatelessWidget {
  final List<Task> tasks;

  const CategoriesSummary({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    return StatisticsCard(
      color: Colors.orange.shade200,
      child: ListView.separated(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: categories.length,
        itemBuilder: (ctx, index) {
          final categoryTasks = tasks
              .where((task) => task.categoryId == categories[index].id)
              .toList();

          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CategoryDisplay(
                category: categories[index],
                iconColor: Colors.black87,
                textColor: Colors.black87,
              ),
              Text(
                '${categoryTasks.length}',
                style: TextStyle(color: Colors.black87),
              ),
            ],
          );
        },
        separatorBuilder: (ctx, index) => SizedBox(height: 8),
      ),
    );
  }
}
