import 'package:flutter/material.dart';
import 'package:home_work_1/theme/colors.dart';

final darkColorScheme = ColorScheme.fromSeed(
  seedColor: Colors.blue,
  brightness: Brightness.dark,
);

final darkCustomColors = CustomColors(
  taskTitle: Colors.white,
  taskDescription: Colors.blue,
  deadlineInProgress: Colors.grey,
  staticCardBackground: Colors.black26,
  staticCardBorderTypeOne: Colors.green.shade400,
  staticCardBorderTypeTwo: Colors.blue.shade400,
  deadlineMissed: Colors.red,
);

final darkTheme = ThemeData.dark().copyWith(
  colorScheme: darkColorScheme,
  extensions: [darkCustomColors],
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: darkColorScheme.onPrimaryContainer,
      foregroundColor: darkColorScheme.primaryContainer,
    ),
  ),
);
