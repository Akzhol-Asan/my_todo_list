import 'package:flutter/material.dart';
import 'package:home_work_1/widgets/statistics/statistics_card.dart';

import '../../../models/task.dart';
import '../../../theme/colors.dart';

class TotalTasksAmount extends StatelessWidget {
  final List<Task> tasks;
  const TotalTasksAmount({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final customColors = theme.extension<CustomColors>()!;
    return StatisticsCard(
        // color: Colors.blue.shade200,
        borderColor: customColors.staticCardBorderTypeTwo,
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
