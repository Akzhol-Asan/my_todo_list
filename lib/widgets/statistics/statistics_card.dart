import 'package:flutter/material.dart';

class StatisticsCard extends StatelessWidget {
  final Widget child;
  final Color? color;

  const StatisticsCard({super.key, required this.child, this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        color: color ?? Color.fromRGBO(245, 242, 250, 1),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: child,
        ),
      ),
    );
  }
}
