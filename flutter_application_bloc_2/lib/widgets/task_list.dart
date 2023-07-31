import 'package:flutter/material.dart';

import '../models/task.dart';
import 'task_tile.dart';

class TaskList extends StatelessWidget {
  const TaskList({
    super.key,
    required this.tasksList,
  });

  final List<Task> tasksList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: ExpansionPanelList.radio(
          children: tasksList
              .map(
                (task) => ExpansionPanelRadio(
                  value: task.id,
                  headerBuilder: (context, isOpen) => TaskTile(
                    currentTask: task,
                  ),
                  body: ListTile(
                    title: SelectableText.rich(
                      TextSpan(
                        children: [
                          const TextSpan(
                              text: "Text:\n",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(
                            text: task.title,
                          ),
                          const TextSpan(
                              text: "\n\nDescription:\n",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(
                            text: task.description,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
// ListView.builder(
//         itemCount: tasksList.length,
//         itemBuilder: (context, index) {
//           var currentTask = tasksList[index];
//           return TaskTile(currentTask: currentTask);
//         });
