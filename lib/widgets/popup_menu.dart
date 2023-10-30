import 'package:flutter/material.dart';
import 'package:photo_editor/models/task.dart';

class PopupMenu extends StatelessWidget {
  final Task task;
  final VoidCallback cancelOrDeleteCallBack;
  const PopupMenu({
    super.key,
    required this.cancelOrDeleteCallBack,
    required this.task,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        itemBuilder: task.isDeleted == false
            ? ((context) => [
                  PopupMenuItem(
                    child: TextButton.icon(
                        onPressed: null,
                        icon: const Icon(Icons.edit),
                        label: const Text('Edit')),
                    onTap: () {},
                  ),
                  PopupMenuItem(
                      child: TextButton.icon(
                          onPressed: null,
                          icon: const Icon(Icons.bookmark),
                          label: const Text('Add')),
                      onTap: () {}),
                  PopupMenuItem(
                      onTap: cancelOrDeleteCallBack,
                      child: TextButton.icon(
                          onPressed: null,
                          icon: const Icon(Icons.delete),
                          label: const Text('Delete'))),
                ])
            : (context) => [
                  PopupMenuItem(
                      onTap: cancelOrDeleteCallBack,
                      child: TextButton.icon(
                          onPressed: null,
                          icon: const Icon(Icons.restore_from_trash),
                          label: const Text('Restore'))),
                  PopupMenuItem(
                      onTap: cancelOrDeleteCallBack,
                      child: TextButton.icon(
                          onPressed: null,
                          icon: const Icon(Icons.delete_forever),
                          label: const Text('Delete Forever'))),
                ]);
  }
}
