import 'package:flutter/material.dart';
import 'package:todo1st/app/modules/todos/domain/entities/index.dart';

/// Signature of this widget callbacks.
typedef CheckCallback = void Function(String uid, bool checked);

///
class TaskList extends StatelessWidget {
  const TaskList({
    Key? key,
    required this.items,
    required this.onItemChecked,
  }) : super(key: key);

  final Stream<List<Todo>>? items;
  final CheckCallback? onItemChecked;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Todo>>(
      stream: items,
      builder: (_, AsyncSnapshot<List<Todo>> snapshots) {
        if (!snapshots.hasData) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }
        return ListView.builder(
          itemBuilder: (_, index) {
            final task = snapshots.data![index];
            return CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              key: Key(task.uid),
              title: Text(task.description),
              value: task.done,
              onChanged: (checked) => onItemChecked!(task.uid, checked!),
            );
          },
          itemCount: snapshots.data!.length,
        );
      },
    );
  }
}
