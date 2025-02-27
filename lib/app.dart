import 'package:flutter/material.dart';
import 'package:home_work_1/screens/tasks_screen.dart';

import 'models/task.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

List<Task> tasks = [
  Task(title: 'Task example #1'),
  Task(title: 'Task example #2'),
  Task(title: 'Task example #3'),
  Task(title: 'Task example #4'),
];

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tasks'),
      ),
      body: TasksScreen(tasks: tasks),
    );
  }
}
