import 'package:flutter/material.dart';
import 'package:todo1st/app/modules/todos/domain/index.dart';

/// Signature of this widget callbacks.
typedef CheckCallback = void Function(String uid, bool checked);

///
class TodoList extends StatelessWidget {
  const TodoList({
    Key? key,
    required this.items,
    required this.onItemChecked,
  }) : super(key: key);

  final List<TodoEntity>? items;
  final CheckCallback? onItemChecked;

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate(
      (_, index) {
        final todo = items![index];
        return CheckboxListTile(
          controlAffinity: ListTileControlAffinity.leading,
          key: Key(todo.uid),
          title: Text(todo.description),
          value: todo.done,
          onChanged: (checked) => onItemChecked!(todo.uid, checked!),
        );
      },
      childCount: items!.length,
    ));
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
