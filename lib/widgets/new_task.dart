import 'package:flutter/material.dart';
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

  void onCanceled() {
    Navigator.pop(context);
  }

  void onSaved() {
    final newTask = Task(title: title, description: description, isDone: false);
    widget.onTaskCreated(newTask);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250,
      padding: EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Column(
          children: [
            Expanded(
                child: TextField(
              onChanged: (value) => setState(() => title = value),
              decoration: InputDecoration(label: Text('Task')),
            )),
            SizedBox(width: 8),
            Expanded(
                child: TextField(
              onChanged: (value) => setState(() => description = value),
              decoration: InputDecoration(label: Text('Description')),
            )),
            SizedBox(height: 10),
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
