import 'package:flutter/material.dart';
import 'package:home_work_1/models/task_category.dart';

final categories = [
  TaskCategory(
      id: 'work',
      title: 'Work',
      icon: Icons.factory_outlined,
      iconColor: Colors.green.shade700),
  TaskCategory(
      id: 'personal',
      title: 'Personal',
      icon: Icons.person,
      iconColor: Colors.blue.shade700),
  TaskCategory(
      id: 'school',
      title: 'School',
      icon: Icons.school_outlined,
      iconColor: Colors.orange.shade700),
  TaskCategory(
      id: 'event',
      title: 'Event',
      icon: Icons.celebration_outlined,
      iconColor: Colors.purple.shade300),
];

final allCategories = [
  TaskCategory(
      id: 'all',
      title: 'All',
      icon: Icons.format_list_bulleted,
      iconColor: Colors.red.shade700),
  TaskCategory(
      id: 'work',
      title: 'Work',
      icon: Icons.factory_outlined,
      iconColor: Colors.green.shade700),
  TaskCategory(
      id: 'personal',
      title: 'Personal',
      icon: Icons.person,
      iconColor: Colors.blue.shade700),
  TaskCategory(
      id: 'school',
      title: 'School',
      icon: Icons.school_outlined,
      iconColor: Colors.orange.shade700),
  TaskCategory(
      id: 'event',
      title: 'Event',
      icon: Icons.celebration_outlined,
      iconColor: Colors.purple.shade700),
];
