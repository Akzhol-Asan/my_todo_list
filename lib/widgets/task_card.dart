import 'package:flutter/material.dart';
import 'package:home_work_1/helpers/format_datetime.dart';
import '../models/task.dart';
import 'category_display.dart';

class TaskCard extends StatefulWidget {
  final Task task;

  const TaskCard({
    super.key,
    required this.task,
  });

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  bool isDone = false;
  String? doneTime;
  bool deadlineIsFailed = false;

  void taskIsDone() {
    setState(() {
      isDone = !isDone;
      if (isDone) {
        doneTime = formatDateTime(DateTime.now());
        if (widget.task.dateTime != null) {
          deadlineIsFailed = DateTime.now().isAfter(widget.task.dateTime!);
        } else {
          deadlineIsFailed = false;
        }
      } else {
        doneTime = null;
        deadlineIsFailed = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final titleSmallStyle = theme.textTheme.titleSmall!;
    final category = widget.task.category;

    return SizedBox(
      width: double.infinity,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Task title, description & Check Box button
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.task.title,
                          style: theme.textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                            decoration: isDone
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                            color: isDone ? Colors.grey : Colors.black,
                          ),
                        ),
                        Text(
                          widget.task.description,
                          style: theme.textTheme.bodyMedium!.copyWith(
                            color: theme.colorScheme.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: taskIsDone,
                    icon: Icon(
                      isDone ? Icons.check_box : Icons.check_box_outline_blank,
                      color: isDone ? Colors.green : Colors.blue,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 4),
              // Deadline
              Text(
                widget.task.dateTime != null
                    ? 'Deadline: ${formatDateTime(widget.task.dateTime!)}'
                    : 'No deadline set',
                style:
                    titleSmallStyle.copyWith(color: theme.colorScheme.tertiary),
              ),
              //DoneTime
              Text(
                isDone ? 'Done time: $doneTime' : 'In Progress...',
                style: titleSmallStyle.copyWith(
                    color: isDone
                        ? (deadlineIsFailed
                            ? theme.colorScheme.error
                            : Colors.green.shade800)
                        : theme.colorScheme.tertiary,
                    decoration: deadlineIsFailed
                        ? TextDecoration.underline
                        : TextDecoration.none),
              ),
              SizedBox(height: 10),
              //Task category
              Container(
                padding: EdgeInsets.only(top: 2, bottom: 2, right: 6, left: 6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: category.iconColor,
                ),
                child: CategoryDisplay(category: category),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
