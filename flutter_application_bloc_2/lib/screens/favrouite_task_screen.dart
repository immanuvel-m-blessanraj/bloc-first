import 'package:flutter/material.dart';

import '../blocs/bloc_export.dart';
import '../models/task.dart';
import '../widgets/task_list.dart';

class FavouriteTaskScreen extends StatelessWidget {
  const FavouriteTaskScreen({super.key});
  static const id = "task_screen";

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> favouriteTasks = state.favouriteTasks;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Chip(label: Text("${favouriteTasks.length} Tasks")),
            ),
            TaskList(tasksList: favouriteTasks)
          ],
        );
      },
    );
  }
}
