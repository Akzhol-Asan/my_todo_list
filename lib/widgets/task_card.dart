import 'package:flutter/material.dart';
import 'package:home_work_1/helpers/format_datetime.dart';
import '../models/task.dart';

class TaskCard extends StatefulWidget {
  final Task task;

  const TaskCard({super.key, required this.task});

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
        deadlineIsFailed = DateTime.now().isAfter(widget.task.dateTime);
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

    return SizedBox(
      width: double.infinity,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Task title
              Text(
                widget.task.title,
                style: theme.textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                  decoration:
                      isDone ? TextDecoration.lineThrough : TextDecoration.none,
                  color: isDone ? Colors.grey : Colors.black,
                ),
              ),
              //Task description
              Text(
                widget.task.description,
                style: theme.textTheme.bodyMedium!.copyWith(
                  color: theme.colorScheme.primary,
                ),
              ),
              SizedBox(height: 4),
              //Deadline
              Text(
                'Deadline: ${formatDateTime(widget.task.dateTime)}',
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
                  padding:
                      EdgeInsets.only(top: 2, bottom: 2, right: 6, left: 6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: widget.task.category.iconColor,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        widget.task.category.icon,
                        size: 16,
                        color: Colors.white,
                      ),
                      SizedBox(width: 4),
                      Text(widget.task.category.title,
                          style: titleSmallStyle.copyWith(color: Colors.white))
                    ],
                  )),
              SizedBox(height: 8),
              //Done & Delete buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green.shade800,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5))),
                      onPressed: taskIsDone,
                      child: Text('Done',
                          style: theme.textTheme.bodyMedium!.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: theme.colorScheme.error,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5))),
                      onPressed: () {},
                      child: Text('Delete',
                          style: theme.textTheme.bodyMedium!.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
