import 'package:flutter/material.dart';
import 'package:home_work_1/data/categories_data.dart';
import 'package:home_work_1/helpers/format_datetime.dart';
import 'package:home_work_1/models/task.dart';

class TaskForm extends StatefulWidget {
  final void Function(Task newTask) onTaskSaved;
  final Task? existingTask;
  const TaskForm({
    super.key,
    required this.onTaskSaved,
    this.existingTask,
  });
  @override
  State<TaskForm> createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {
  var selectedDate = DateTime.now();
  var selectedTimeOfDay = TimeOfDay.now();
  String? selectedCategory;
  final dateController = TextEditingController();
  final timeController = TextEditingController();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  bool isDeadlineRemoved = false;

  @override
  void initState() {
    super.initState();
    if (widget.existingTask != null) {
      final existingTask = widget.existingTask!;
      titleController.text = existingTask.title;
      descriptionController.text = existingTask.description;
      selectedCategory = existingTask.categoryId;
      if (existingTask.dateTime != null) {
        selectedDate = existingTask.dateTime!;
        selectedTimeOfDay = TimeOfDay.fromDateTime(selectedDate);
      } else {
        selectedDate = DateTime.now();
        selectedTimeOfDay = TimeOfDay.now();
      }
    } else {
      selectedDate = DateTime.now();
      selectedTimeOfDay = TimeOfDay.now();
    }
    dateController.text = formatDate(selectedDate);
    timeController.text = formatTime(selectedTimeOfDay);
  }

  @override
  void dispose() {
    dateController.dispose();
    timeController.dispose();
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  void onCanceled() {
    Navigator.pop(context);
  }

  void onSaved() {
    if (isTaskInvalid()) {
      return;
    }

    DateTime? dateTime;
    if (!isDeadlineRemoved) {
      dateTime = DateTime(
        selectedDate.year,
        selectedDate.month,
        selectedDate.day,
        selectedTimeOfDay.hour,
        selectedTimeOfDay.minute,
      );
    }

    final newTask = Task(
      id: widget.existingTask?.id,
      title: titleController.text.trim(),
      description: descriptionController.text.trim(),
      isDone: false,
      dateTime: dateTime,
      categoryId: selectedCategory!,
    );

    widget.onTaskSaved(newTask);
    Navigator.pop(context);
  }

  void onDateTap() async {
    final now = DateTime.now();
    final lastDate = DateTime(now.year + 1);
    final dateFromUser = await showDatePicker(
      context: context,
      firstDate: now,
      lastDate: lastDate,
      initialDate: selectedDate,
    );
    if (dateFromUser != null) {
      setState(() {
        selectedDate = dateFromUser;
        dateController.text = formatDate(dateFromUser);
      });
    }
  }

  void onTimeTap() async {
    final pickedTime =
        await showTimePicker(context: context, initialTime: selectedTimeOfDay);
    if (pickedTime != null) {
      selectedTimeOfDay = pickedTime;
      timeController.text = formatTime(pickedTime);
    }
  }

  bool isTaskInvalid() {
    return titleController.text.trim().isEmpty ||
        descriptionController.text.trim().isEmpty ||
        selectedCategory == null;
  }

  void onRemoveDeadline() {
    setState(() {
      isDeadlineRemoved = true;
      selectedDate = DateTime.now();
      selectedTimeOfDay = TimeOfDay.now();
      dateController.text = '';
      timeController.text = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(16, 16, 16, bottomInset + 16),
      child: Column(
        children: [
          //Task title
          SizedBox(
              child: TextField(
            controller: titleController,
            decoration: InputDecoration(label: Text('Task')),
          )),
          SizedBox(width: 8),
          //Description
          SizedBox(
              child: TextField(
            controller: descriptionController,
            decoration: InputDecoration(label: Text('Description')),
          )),
          SizedBox(height: 8),
          //Categories
          DropdownMenu(
            expandedInsets: EdgeInsets.zero,
            label: Text('Category'),
            inputDecorationTheme: theme.inputDecorationTheme,
            initialSelection: selectedCategory,
            onSelected: (value) => setState(() => selectedCategory = value),
            dropdownMenuEntries: categories
                .map(
                  (category) => DropdownMenuEntry(
                    value: category.id,
                    leadingIcon: Icon(category.icon, color: category.iconColor),
                    label: category.title,
                    labelWidget: Text(
                      ' ${category.title}',
                      style: TextStyle(color: category.iconColor),
                    ),
                  ),
                )
                .toList(),
          ),
          SizedBox(height: 16),
          //Deadline date & time
          Row(
            children: [
              Expanded(
                child: TextField(
                  onTap: onDateTap,
                  readOnly: true,
                  controller: dateController,
                  decoration: InputDecoration(
                    label: Text('Deadline Date'),
                  ),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: TextField(
                  onTap: onTimeTap,
                  readOnly: true,
                  controller: timeController,
                  decoration: InputDecoration(
                    label: Text('Deadline Time'),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          //Remove deadline button
          SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5))),
                  onPressed: onRemoveDeadline,
                  child: Text('Remove Deadline'))),
          SizedBox(height: 22),
          //Cancel & Save buttons
          Row(
            children: [
              Expanded(
                  child:
                      TextButton(onPressed: onCanceled, child: Text('Cancel'))),
              SizedBox(width: 8),
              Expanded(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5))),
                      onPressed: isTaskInvalid() ? null : onSaved,
                      child: Text('Save'))),
            ],
          ),
        ],
      ),
    );
  }
}
