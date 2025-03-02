import 'package:flutter/material.dart';
import 'package:home_work_1/models/task_category.dart';
import 'package:home_work_1/screens/tasks_screen.dart';
import 'package:home_work_1/widgets/new_task.dart';

import 'data/categories_data.dart';
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
        dateTime: DateTime.now(),
        categoryId: 'work'),
    Task(
        title: 'Task example #2',
        isDone: false,
        description: 'task description',
        dateTime: DateTime(DateTime.now().year + 5),
        categoryId: 'personal'),
    Task(
        title: 'Task example #3',
        isDone: false,
        description: 'task description',
        dateTime: DateTime.now(),
        categoryId: 'school'),
    Task(
        title: 'Task example #4',
        isDone: false,
        description: 'task description',
        dateTime: DateTime.now(),
        categoryId: 'event'),
  ];

  void addTask(Task newTask) {
    setState(() {
      tasks.add(newTask);
    });
  }

  void openAddTaskSheet() {
    showModalBottomSheet(
      isScrollControlled: true,
      useSafeArea: true,
      context: context,
      builder: (ctx) => NewTask(
        onTaskCreated: addTask,
      ),
    );
  }

  void openFilter() {
    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(100, 80, 0, 0),
      items: allCategories.map((category) {
        return PopupMenuItem<TaskCategory>(
          value: category,
          child: Row(
            children: [
              Icon(category.icon, color: category.iconColor),
              SizedBox(width: 10),
              Text(category.title),
            ],
          ),
        );
      }).toList(),
    ).then((selectedCategory) {
      if (selectedCategory != null) {
        setState(() {
          _selectedCategory = selectedCategory;
        });
      }
    });
  }

  TaskCategory? _selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tasks'),
        actions: [
          //Categories filter Text
          Text(_selectedCategory != null ? _selectedCategory!.title : '',
              style: TextStyle(color: Colors.blue)),
          //Categories filter button
          IconButton(
              onPressed: openFilter,
              icon: Icon(Icons.filter_list,
                  color:
                      _selectedCategory != null ? Colors.blue : Colors.black)),
          //Add new task button
          IconButton(onPressed: openAddTaskSheet, icon: Icon(Icons.add))
        ],
      ),
      body: TasksScreen(tasks: tasks, selectedCategory: _selectedCategory),
    );
  }
}
