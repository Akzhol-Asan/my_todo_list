import 'package:flutter/material.dart';
import 'package:home_work_1/theme/dark_theme.dart';
import 'package:home_work_1/theme/light_theme.dart';
import 'app.dart';

void main() {
  runApp(
    MaterialApp(
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      home: App(),
    ),
  );
}
