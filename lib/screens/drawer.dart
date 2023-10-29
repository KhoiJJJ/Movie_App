import 'package:flutter/material.dart';
import 'package:photo_editor/blocs/bloc_exports.dart';
import 'package:photo_editor/screens/completed_screen.dart';
import 'package:photo_editor/screens/recycle_bin.dart';
import 'package:photo_editor/screens/tabs_screen.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              color: Colors.grey,
              child: Text(
                'Drawer',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            BlocBuilder<TaskBloc, TaskState>(
              builder: (context, state) => ListTile(
                onTap: () =>
                    Navigator.of(context).pushReplacementNamed(TabsScreen.id),
                leading: const Icon(Icons.folder_special),
                title: const Text('My Tasks '),
                trailing: Text('${state.pendingTasks.length}'),
              ),
            ),
            BlocBuilder<TaskBloc, TaskState>(
              builder: (context, state) => ListTile(
                onTap: () => Navigator.of(context)
                    .pushReplacementNamed(CompletedScreen.id),
                leading: const Icon(Icons.folder_off),
                title: const Text('Completed Tasks '),
                trailing: Text('${state.completedTasks.length}'),
              ),
            ),
            const Divider(),
            BlocBuilder<TaskBloc, TaskState>(
                builder: (context, state) => ListTile(
                      onTap: () => Navigator.of(context)
                          .pushReplacementNamed(RecycleBin.id),
                      leading: const Icon(Icons.delete),
                      title: const Text('Bin'),
                      trailing: Text('${state.removedTasks.length}'),
                    )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text('Theme:'),
                BlocBuilder<SwitchBloc, SwitchState>(
                    builder: (context, state) => Switch(
                        value: state.switchValue,
                        onChanged: (newValue) {
                          newValue
                              ? context.read<SwitchBloc>().add(SwitchOn())
                              : context.read<SwitchBloc>().add(SwitchOff());
                        })),
              ],
            )
          ],
        ),
      ),
    );
  }
}
