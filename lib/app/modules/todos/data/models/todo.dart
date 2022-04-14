import 'package:todo1st/app/modules/todos/domain/index.dart';

/// Data implementation of todo
class TodoModel extends TodoEntity {
  const TodoModel({
    required String description,
    required bool done,
    required String uid,
  }) : super(
          description: description,
          done: done,
          uid: uid,
        );

  factory TodoModel.empty() => const TodoModel(
        description: '',
        done: false,
        uid: '',
      );

  TodoModel copyWith({
    String? description,
    bool? done,
    String? uid,
  }) {
    return TodoModel(
      description: description ?? this.description,
      done: done ?? this.done,
      uid: uid ?? this.uid,
    );
  }
}
