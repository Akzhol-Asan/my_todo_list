import 'package:home_work_1/data/categories_data.dart';
import 'package:home_work_1/models/task_category.dart';

class Task {
  final String title;
  final String description;
  final bool isDone;
  final DateTime dateTime;
  final String categoryId;

  Task({
    required this.title,
    required this.description,
    required this.isDone,
    required this.dateTime,
    required this.categoryId,
  });

  TaskCategory get category {
    return categories.firstWhere((category) => category.id == categoryId);
  }
}
