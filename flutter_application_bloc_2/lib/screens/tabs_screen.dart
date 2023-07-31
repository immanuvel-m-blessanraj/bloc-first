import 'package:flutter/material.dart';

import 'add_task_screen.dart';
import 'completed_task_screen.dart';
import 'favrouite_task_screen.dart';
import 'my_drawer.dart';
import 'pending_screens.dart';

class TabsScreen extends StatefulWidget {
  static const id = "tabs_screen";
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  static final List<Map<String, dynamic>> _pageDetails = [
    {
      "pageName": const PendingTaskScreen(),
      "title": "Pending Tasks",
    },
    {
      "pageName": const CompletedTaskScreen(),
      "title": "Pending Tasks",
    },
    {
      "pageName": const FavouriteTaskScreen(),
      "title": "Pending Tasks",
    },
  ];

  void _addTask(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) => const SingleChildScrollView(
              child: AddTaskScreen(),
            ));
  }

  late int _selectedPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pageDetails[_selectedPageIndex]['title']),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _addTask(context),
          )
        ],
      ),
      drawer: const MyDrawer(),
      body: _pageDetails[_selectedPageIndex]['pageName'],
      floatingActionButton: _selectedPageIndex == 0
          ? FloatingActionButton(
              onPressed: () => _addTask(context),
              tooltip: "Add Task",
              child: const Icon(Icons.add),
            )
          : null,
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedPageIndex,
          onTap: (index) {
            setState(
              () => _selectedPageIndex = index,
            );
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.incomplete_circle_sharp),
                label: "Pending Task"),
            BottomNavigationBarItem(
                icon: Icon(Icons.done), label: "Completed Task"),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: "Favorite Task")
          ]),
    );
  }
}
