import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:photo_editor/widgets/popup_menu.dart';

import '../blocs/bloc_exports.dart';
import '../models/task.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    super.key,
    required this.task,
  });

  final Task task;
  void _removeOrDeleteTask(BuildContext context, Task task) {
    task.isDeleted!
        ? context.read<TaskBloc>().add(DeleteTask(task: task))
        : context.read<TaskBloc>().add(RemoveTask(task: task));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Icon(Icons.favorite_outline),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(task.title,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      decoration:
                          task.isDone! ? TextDecoration.lineThrough : null)),
              const SizedBox(
                height: 7,
              ),
              Text(DateFormat().add_yMMMd().add_Hms().format(DateTime.now()))
            ],
          ),
          Row(
            children: [
              Checkbox(
                value: task.isDone,
                onChanged: task.isDeleted == false
                    ? (value) {
                        context.read<TaskBloc>().add(UpdateTask(task: task));
                      }
                    : null,
              ),
              PopupMenu(
                task: task,
                cancelOrDeleteCallBack: () =>
                    _removeOrDeleteTask(context, task),
              )
            ],
          ),
        ],
      ),
    );
  }
}
