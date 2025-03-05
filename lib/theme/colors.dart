import 'package:flutter/material.dart';

class CustomColors extends ThemeExtension<CustomColors> {
  final Color taskTitle;
  final Color taskDescription;
  final Color deadlineInProgress;
  final Color staticCardBackground;
  final Color staticCardBorderTypeOne;
  final Color staticCardBorderTypeTwo;
  final Color deadlineMissed;

  CustomColors({
    required this.taskTitle,
    required this.taskDescription,
    required this.deadlineInProgress,
    required this.staticCardBackground,
    required this.staticCardBorderTypeOne,
    required this.staticCardBorderTypeTwo,
    required this.deadlineMissed,
  });

  @override
  ThemeExtension<CustomColors> copyWith({
    Color? taskTitle,
    Color? taskDescription,
    Color? deadlineInProgress,
    Color? staticCardBackground,
    Color? staticCardBorder,
    Color? staticCardBorderTypeTwo,
    Color? deadlineMissed,
  }) {
    return CustomColors(
      taskTitle: taskTitle ?? this.taskTitle,
      taskDescription: taskDescription ?? this.taskDescription,
      deadlineInProgress: deadlineInProgress ?? this.deadlineInProgress,
      staticCardBackground: staticCardBackground ?? this.staticCardBackground,
      staticCardBorderTypeOne: staticCardBorder ?? this.staticCardBorderTypeOne,
      staticCardBorderTypeTwo:
          staticCardBorderTypeTwo ?? this.staticCardBorderTypeTwo,
      deadlineMissed: deadlineMissed ?? this.deadlineMissed,
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
      staticCardBackground:
          Color.lerp(staticCardBackground, other.staticCardBackground, t)!,
      staticCardBorderTypeOne: Color.lerp(
          staticCardBorderTypeOne, other.staticCardBorderTypeOne, t)!,
      staticCardBorderTypeTwo: Color.lerp(
          staticCardBorderTypeTwo, other.staticCardBorderTypeTwo, t)!,
      deadlineMissed: Color.lerp(deadlineMissed, other.deadlineMissed, t)!,
    );
  }
}
