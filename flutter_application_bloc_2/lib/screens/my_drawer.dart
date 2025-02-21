import 'package:flutter/material.dart';
import 'package:flutter_application_bloc_2/screens/tabs_screen.dart';

import '../blocs/bloc_export.dart';
import 'recycle_bin.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
            color: Colors.grey,
            child: Text(
              "Task Drawer",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          BlocBuilder<TasksBloc, TasksState>(
            builder: (context, state) {
              return ListTile(
                onTap: () =>
                    Navigator.of(context).pushReplacementNamed(TabsScreen.id),
                leading: const Icon(Icons.folder_special),
                title: const Text("My Tasks"),
                trailing: Text(
                    "${state.pendingTasks.length}|${state.completedTasks.length}"),
              );
            },
          ),
          const Divider(),
          BlocBuilder<TasksBloc, TasksState>(
            builder: (context, state) {
              return ListTile(
                onTap: () =>
                    Navigator.of(context).pushReplacementNamed(RecycleBin.id),
                leading: const Icon(Icons.delete),
                title: const Text("Bin"),
                trailing: Text("${state.removedTasks.length}"),
              );
            },
          ),
          BlocBuilder<SwicthBloc, SwicthState>(
            builder: (context, state) {
              return Switch(
                  value: state.switchValue,
                  onChanged: (newValue) {
                    newValue
                        ? context.read<SwicthBloc>().add(SwitchOnEvent())
                        : context.read<SwicthBloc>().add(SwitchOffEvent());
                  });
            },
          )
        ],
      ),
    );
  }
}
