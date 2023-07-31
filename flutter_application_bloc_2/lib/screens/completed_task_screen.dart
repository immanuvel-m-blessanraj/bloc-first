import 'package:flutter/material.dart';

import '../blocs/bloc_export.dart';
import '../models/task.dart';
import '../widgets/task_list.dart';

class CompletedTaskScreen extends StatelessWidget {
  const CompletedTaskScreen({super.key});
  static const id = "task_screen";
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> tasksList = state.completedTasks;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Chip(label: Text("${tasksList.length} Tasks")),
            ),
            TaskList(tasksList: tasksList)
          ],
        );
      },
    );
  }
}
