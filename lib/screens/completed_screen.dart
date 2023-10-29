// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../blocs/bloc_exports.dart';
import '../models/task.dart';
import '../widgets/tasks_list.dart';

class CompletedScreen extends StatefulWidget {
  const CompletedScreen({Key? key}) : super(key: key);
  static const id = 'completed_screen';

  @override
  State<CompletedScreen> createState() => _CompletedScreenState();
}

class _CompletedScreenState extends State<CompletedScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        List<Task> taskList = state.completedTasks;
        return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Center(
            child: Chip(
              label: Text(
                '${taskList.length} Task',
              ),
            ),
          ),
          TaskLists(taskList: taskList)
        ]);
      },
    );
  }
}
