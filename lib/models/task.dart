import 'package:home_work_1/data/categories_data.dart';
import 'package:home_work_1/models/task_category.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Task {
  final String id;
  final String title;
  final String description;
  final bool isDone;
  final DateTime? dateTime;
  final String categoryId;

  Task({
    String? id,
    required this.title,
    required this.description,
    required this.isDone,
    this.dateTime,
    required this.categoryId,
  }) : id = id ?? uuid.v4();

  TaskCategory get category {
    return categories.firstWhere((category) => category.id == categoryId);
  }
}
