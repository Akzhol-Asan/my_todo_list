import 'package:flutter/material.dart';
import 'package:home_work_1/data/categories_data.dart';
import 'package:home_work_1/widgets/category_display.dart';
import 'package:home_work_1/widgets/statistics/statistics_card.dart';
import 'package:home_work_1/models/task.dart';

import '../../../theme/colors.dart';

class CategoriesSummary extends StatelessWidget {
  final List<Task> tasks;

  const CategoriesSummary({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customColors = theme.extension<CustomColors>()!;

    return StatisticsCard(
      // color: Colors.orange.shade200,
      borderColor: customColors.staticCardBorderTypeTwo,
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
                iconColor: customColors.taskTitle,
                textColor: customColors.taskTitle,
              ),
              Text(
                '${categoryTasks.length}',
              ),
            ],
          );
        },
        separatorBuilder: (ctx, index) => SizedBox(height: 8),
      ),
    );
  }
}
