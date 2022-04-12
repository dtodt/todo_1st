import 'package:todo1st/app/modules/todos/domain/entities/index.dart';

/// Data implementation of todo count
class TodoCountModel extends TodoCountEntity {
  const TodoCountModel({
    required int all,
    required int available,
    required int done,
  }) : super(
          all: all,
          available: available,
          done: done,
        );

  factory TodoCountModel.empty() => const TodoCountModel(
        all: 0,
        available: 0,
        done: 0,
      );

  TodoCountModel copyWith({
    int? all,
    int? available,
    int? done,
  }) {
    return TodoCountModel(
      all: all ?? this.all,
      available: available ?? this.available,
      done: done ?? this.done,
    );
  }
}
