import 'package:flutter/material.dart';

class CustomColors extends ThemeExtension<CustomColors> {
  final Color taskTitle;
  final Color taskDescription;
  final Color deadlineInProgress;

  CustomColors({
    required this.taskTitle,
    required this.taskDescription,
    required this.deadlineInProgress,
  });

  @override
  ThemeExtension<CustomColors> copyWith(
      {Color? taskTitle, Color? taskDescription, Color? deadlineInProgress}) {
    return CustomColors(
      taskTitle: taskTitle ?? this.taskTitle,
      taskDescription: taskDescription ?? this.taskDescription,
      deadlineInProgress: deadlineInProgress ?? this.deadlineInProgress,
    );
  }

  @override
  ThemeExtension<CustomColors> lerp(
      covariant ThemeExtension<CustomColors>? other, double t) {
    if (other is! CustomColors) return this;

    return CustomColors(
      taskTitle: Color.lerp(taskTitle, other.taskTitle, t)!,
      taskDescription: Color.lerp(taskDescription, other.taskDescription, t)!,
      deadlineInProgress:
          Color.lerp(deadlineInProgress, other.deadlineInProgress, t)!,
    );
  }
}
