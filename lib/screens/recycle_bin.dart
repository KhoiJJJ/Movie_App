import 'package:flutter/material.dart';

import '../blocs/bloc_exports.dart';
import '../widgets/tasks_list.dart';
import 'drawer.dart';

class RecycleBin extends StatelessWidget {
  const RecycleBin({super.key});
  static const id = 'recycle_bin_screen';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
        builder: (context, state) => Scaffold(
              appBar: AppBar(
                title: const Text('Recycle Bin'),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.add),
                  )
                ],
              ),
              drawer: const MyDrawer(),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Chip(
                      label: Text(
                        ' ${state.removedTasks.length}Task',
                      ),
                    ),
                  ),
                  TaskLists(taskList: state.removedTasks)
                ],
              ),
            ));
  }
}
