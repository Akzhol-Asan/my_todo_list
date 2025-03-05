import 'package:flutter/material.dart';
import 'package:home_work_1/theme/colors.dart';

final lightColorScheme = ColorScheme.fromSeed(
  seedColor: Colors.blue,
).copyWith(
  onPrimaryContainer: Colors.blue,
  primaryContainer: Colors.white,
);

final lightCustomColors = CustomColors(
  taskTitle: Colors.black,
  taskDescription: Colors.black87,
  deadlineInProgress: Colors.grey,
);

final lightTheme = ThemeData.light().copyWith(
  colorScheme: lightColorScheme,
  extensions: [lightCustomColors],
  appBarTheme: AppBarTheme().copyWith(
    backgroundColor: lightColorScheme.onPrimaryContainer,
    foregroundColor: lightColorScheme.primaryContainer,
  ),
  navigationBarTheme: NavigationBarThemeData(
    backgroundColor: lightColorScheme.primaryContainer,
    indicatorColor: Colors.lightBlueAccent,
    labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
    iconTheme: WidgetStateProperty.resolveWith<IconThemeData>(
      (Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return const IconThemeData(color: Colors.red);
        }
        return const IconThemeData(color: Colors.blue);
      },
    ),
    labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>(
      (Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return const TextStyle(
              color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 12);
        }
        return const TextStyle(color: Colors.grey, fontSize: 12);
      },
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: lightColorScheme.onPrimaryContainer,
      foregroundColor: lightColorScheme.primaryContainer,
    ),
  ),
);
