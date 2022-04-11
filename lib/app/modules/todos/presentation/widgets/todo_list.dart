import 'package:flutter/material.dart';
import 'package:todo1st/app/modules/todos/domain/entities/index.dart';

/// Signature of this widget callbacks.
typedef CheckCallback = void Function(String uid, bool checked);

///
class TodoList extends StatelessWidget {
  const TodoList({
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
      builder: (context, AsyncSnapshot<List<Todo>> snapshots) {
        if (!snapshots.hasData || snapshots.data!.isEmpty) {
          return DataFallback(loading: !snapshots.hasData);
        }

        return SliverList(
            delegate: SliverChildBuilderDelegate(
          (_, index) {
            final task = snapshots.data![index];
            return CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              key: Key(task.uid),
              title: Text(task.description),
              value: task.done,
              onChanged: (checked) => onItemChecked!(task.uid, checked!),
            );
          },
          childCount: snapshots.data!.length,
        ));
      },
    );
  }
}

/// Widget to use when the data is not present
class DataFallback extends StatelessWidget {
  final bool loading;

  const DataFallback({
    Key? key,
    required this.loading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Center(
        child: loading
            ? const CircularProgressIndicator.adaptive()
            : const Icon(
                Icons.playlist_add,
                color: Colors.white30,
                size: 64,
              ),
      ),
    );
  }
}
