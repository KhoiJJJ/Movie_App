import 'package:flutter/material.dart';
import 'package:photo_editor/widgets/task_tile.dart';
import '../models/task.dart';

class TaskLists extends StatelessWidget {
  const TaskLists({
    super.key,
    required this.taskList,
  });

  final List<Task> taskList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: ExpansionPanelList.radio(
          children: taskList
              .map((task) => ExpansionPanelRadio(
                  value: task.id,
                  headerBuilder: (context, isOpen) => TaskTile(task: task),
                  body: Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: SelectableText.rich(TextSpan(children: [
                        const TextSpan(
                            text: 'Text:\n',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: task.title),
                        const TextSpan(
                            text: '\n\nDescription:\n',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: task.description),
                      ])),
                    ),
                  )))
              .toList(),
        ),
      ),
    );
  }
}
