import 'package:flutter/material.dart';

class TaskCategory {
  final String id;
  final String title;
  final IconData icon;
  final Color iconColor;

  TaskCategory({
    required this.id,
    required this.title,
    required this.icon,
    required this.iconColor,
  });
}
