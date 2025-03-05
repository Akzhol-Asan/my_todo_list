import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:home_work_1/models/task_category.dart';
import 'package:home_work_1/widgets/task_card.dart';
import '../models/task.dart';
import '../theme/colors.dart';

class TasksScreen extends StatelessWidget {
  final List<Task> tasks;
  final TaskCategory? selectedCategory;
  final void Function(String id) onTaskDeleted;
  final void Function(String id) onTaskEdited;

  const TasksScreen({
    super.key,
    required this.tasks,
    this.selectedCategory,
    required this.onTaskDeleted,
    required this.onTaskEdited,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final filteredTasks =
        selectedCategory == null || selectedCategory!.id == 'all'
            ? tasks
            : tasks
                .where((task) => task.categoryId == selectedCategory!.id)
                .toList();
    final customColors = theme.extension<CustomColors>()!;

    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: ListView.builder(
        itemCount: filteredTasks.length,
        itemBuilder: (ctx, index) {
          final task = filteredTasks[index];
          return Slidable(
            endActionPane: ActionPane(
              extentRatio: 0.4,
              motion: DrawerMotion(),
              children: [
                SlidableAction(
                  onPressed: (ctx) => onTaskDeleted(task.id),
                  icon: Icons.delete,
                  backgroundColor: customColors.deadlineMissed,
                  label: 'Delete',
                  padding: EdgeInsets.zero,
                ),
                SlidableAction(
                  onPressed: (ctx) => onTaskEdited(task.id),
                  icon: Icons.edit,
                  backgroundColor: theme.colorScheme.secondary.withAlpha(220),
                  label: 'Edit',
                  padding: EdgeInsets.zero,
                ),
              ],
            ),
            child: TaskCard(task: task),
          );
        },
      ),
    );
  }
}
