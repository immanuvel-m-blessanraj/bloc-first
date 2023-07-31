import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../blocs/bloc_export.dart';
import '../models/task.dart';
import 'popup_menu.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    super.key,
    required this.currentTask,
  });

  final Task currentTask;

  void _removeOrDeleter(BuildContext ctx, Task task) {
    task.isDeleted!
        ? ctx.read<TasksBloc>().add(DeleteTask(task: task))
        : ctx.read<TasksBloc>().add(RemovedTask(task: task));
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            children: [
              !currentTask.isFavorite!
                  ? const Icon(Icons.star_outline)
                  : const Icon(Icons.star),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      currentTask.title,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          decoration: currentTask.isDone!
                              ? TextDecoration.lineThrough
                              : null),
                    ),
                    Text(DateFormat()
                        .add_yMMMd()
                        .add_Hms()
                        .format(DateTime.parse(currentTask.date))),
                  ],
                ),
              ),
            ],
          ),
        ),
        Checkbox(
            value: currentTask.isDone,
            onChanged: (value) {
              context.read<TasksBloc>().add(UpdateTask(task: currentTask));
            }),
        PopupMenu(
          likeOrDislikeCallback: () {
            context
                .read<TasksBloc>()
                .add(MarkFavoriteOrUnFavoriteTask(task: currentTask));
          },
          cancelOrDeleteCallback: () => _removeOrDeleter(context, currentTask),
          task: currentTask,
        )
      ],
    );
  }
}
