import 'package:flutter/material.dart';
import 'package:home_work_1/screens/tasks_screen.dart';
import 'package:home_work_1/widgets/new_task.dart';

import 'models/task.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  List<Task> tasks = [
    Task(
        title: 'Task example #1',
        isDone: false,
        description: 'task description',
        dateTime: DateTime.now()),
    Task(
        title: 'Task example #2',
        isDone: false,
        description: 'task description',
        dateTime: DateTime(DateTime.now().year + 5)),
    Task(
        title: 'Task example #3',
        isDone: false,
        description: 'task description',
        dateTime: DateTime.now()),
    Task(
        title: 'Task example #4',
        isDone: false,
        description: 'task description',
        dateTime: DateTime.now()),
  ];

  void addTask(Task newTask) {
    setState(() {
      tasks.add(newTask);
    });
  }

  void openAddTaskSheet() {
    showModalBottomSheet(
        context: context,
        builder: (ctx) => NewTask(
              onTaskCreated: addTask,
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tasks'),
        actions: [
          IconButton(onPressed: openAddTaskSheet, icon: Icon(Icons.add))
        ],
      ),
      body: TasksScreen(tasks: tasks),
    );
  }
}
