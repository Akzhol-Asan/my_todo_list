import 'package:flutter/material.dart';

import '../../theme/colors.dart';

class StatisticsCard extends StatelessWidget {
  final Widget child;
  final Color? color;
  final Color? borderColor;

  const StatisticsCard({
    super.key,
    required this.child,
    this.color,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customColors = theme.extension<CustomColors>()!;
    return SizedBox(
      width: double.infinity,
      child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(
              color: borderColor ?? customColors.staticCardBorderTypeOne,
              width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        color: color ?? customColors.staticCardBackground,
        child: Padding(
          padding: EdgeInsets.all(8),
          child: child,
        ),
      ),
    );
  }
}
