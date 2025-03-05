import 'package:flutter/material.dart';
import 'package:home_work_1/models/task_category.dart';
import 'package:home_work_1/screens/statistics_screen.dart';
import 'package:home_work_1/screens/tasks_screen.dart';
import 'package:home_work_1/widgets/task_form.dart';

import 'data/categories_data.dart';
import 'models/destination.dart';
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
        description:
            '- Сначала идут задачи с дедлайном. В конце - задачи без дедлайнов в алфавитном порядке',
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
    Task(
        title: 'B Task example #5',
        isDone: false,
        description: 'task description',
        dateTime: null,
        categoryId: 'event'),
    Task(
        title: 'C Task example #6',
        isDone: false,
        description: 'task description',
        dateTime: null,
        categoryId: 'event'),
    Task(
        title: 'A Task example #7',
        isDone: false,
        description: 'task description',
        dateTime: null,
        categoryId: 'event'),
  ];
  TaskCategory? _selectedCategory;
  int currentScreenIndex = 0;

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
      builder: (ctx) => TaskForm(
        onTaskSaved: addTask,
      ),
    );
  }

  void editTask(Task editedTask) {
    setState(() {
      final index = tasks.indexWhere((task) => task.id == editedTask.id);
      tasks[index] = editedTask;
    });
  }

  void openEditTaskSheet(String id) {
    final existingTask = tasks.firstWhere((task) => task.id == id);
    showModalBottomSheet(
      isScrollControlled: true,
      useSafeArea: true,
      context: context,
      builder: (ctx) => TaskForm(
        onTaskSaved: editTask,
        existingTask: existingTask,
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

  void deleteTask(String id) {
    setState(() {
      tasks.removeWhere((task) => task.id == id);
    });
  }

  void updateCurrentPageIndex(int newIndex) {
    setState(() {
      currentScreenIndex = newIndex;
    });
  }

  List<Destination> get destinations {
    return [
      Destination(
        screenTitle: Text('Tasks'),
        navLabel: 'Tasks',
        navIcon: Icons.receipt_long_outlined,
        navSelectedIcon: Icons.receipt_long,
        appBarActions: [
          Text(
            _selectedCategory != null ? _selectedCategory!.title : '',
          ),
          IconButton(
            onPressed: openFilter,
            icon: Icon(Icons.filter_list,
                color:
                    _selectedCategory != null ? Colors.white : Colors.white70),
          ),
          IconButton(
            onPressed: openAddTaskSheet,
            icon: Icon(Icons.add),
          ),
        ],
        screen: TasksScreen(
          tasks: tasks,
          selectedCategory: _selectedCategory,
          onTaskDeleted: deleteTask,
          onTaskEdited: openEditTaskSheet,
        ),
      ),
      Destination(
        screenTitle: Text('Statistics'),
        navLabel: 'Statistics',
        navIcon: Icons.pie_chart_outline,
        navSelectedIcon: Icons.pie_chart,
        screen: StatisticsScreen(tasks: tasks),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    //Deadline sort
    tasks.sort((a, b) {
      if (a.dateTime != null && b.dateTime == null) {
        return -1;
      } else if (a.dateTime == null && b.dateTime != null) {
        return 1;
      } else if (a.dateTime != null && b.dateTime != null) {
        return a.dateTime!.compareTo(b.dateTime!);
      } else {
        return a.title.compareTo(b.title);
      }
    });

    final destination = destinations[currentScreenIndex];

    return Scaffold(
      appBar: AppBar(
        title: destination.screenTitle,
        actions: destination.appBarActions,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentScreenIndex,
        onDestinationSelected: updateCurrentPageIndex,
        destinations: destinations
            .map((destination) => NavigationDestination(
                icon: Icon(destination.navIcon),
                selectedIcon: Icon(
                  destination.navSelectedIcon,
                  color: Colors.white,
                ),
                label: destination.navLabel))
            .toList(),
      ),
      body: destination.screen,
    );
  }
}
