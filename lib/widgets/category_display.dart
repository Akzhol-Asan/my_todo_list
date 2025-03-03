import 'package:flutter/material.dart';
import 'package:home_work_1/models/task_category.dart';

class CategoryDisplay extends StatelessWidget {
  final TaskCategory category;
  final Color? iconColor;
  final Color? textColor;

  const CategoryDisplay({
    super.key,
    required this.category,
    this.iconColor = Colors.white,
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final titleSmallStyle = theme.textTheme.titleSmall!;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          category.icon,
          size: 16,
          color: iconColor,
        ),
        SizedBox(width: 4),
        Text(category.title, style: titleSmallStyle.copyWith(color: textColor))
      ],
    );
  }
}
