import 'package:flutter/material.dart';
import 'package:home_work_1/helpers/format_datetime.dart';
import 'package:home_work_1/models/task.dart';

class NewTask extends StatefulWidget {
  final void Function(Task newTask) onTaskCreated;

  const NewTask({
    super.key,
    required this.onTaskCreated,
  });

  @override
  State<NewTask> createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  var title = '';
  var description = '';
  var selectedDate = DateTime.now();
  var selectedTimeOfDay = TimeOfDay.now();

  final dateController = TextEditingController();
  final timeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    dateController.text = formatDate(selectedDate);
    timeController.text = formatTime(selectedTimeOfDay);
  }

  void onCanceled() {
    Navigator.pop(context);
  }

  void onSaved() {
    final dateTime = DateTime(
      selectedDate.year,
      selectedDate.month,
      selectedDate.day,
      selectedTimeOfDay.hour,
      selectedTimeOfDay.minute,
    );
    final newTask = Task(
      title: title,
      description: description,
      isDone: false,
      dateTime: dateTime,
    );
    widget.onTaskCreated(newTask);
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

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      padding: EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Column(
          children: [
            //Task title
            Expanded(
                child: TextField(
              onChanged: (value) => setState(() => title = value),
              decoration: InputDecoration(label: Text('Task')),
            )),
            SizedBox(width: 8),
            //Task description
            Expanded(
                child: TextField(
              onChanged: (value) => setState(() => description = value),
              decoration: InputDecoration(label: Text('Description')),
            )),
            SizedBox(height: 10),
            //Deadline Date & time
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
            SizedBox(height: 22),
            //Cancel & Save buttons
            Row(
              children: [
                Expanded(
                    child: TextButton(
                        onPressed: onCanceled, child: Text('Cancel'))),
                SizedBox(width: 8),
                Expanded(
                    child: ElevatedButton(
                        onPressed: onSaved, child: Text('Save'))),
              ],
            )
          ],
        ),
      ),
    );
  }
}
