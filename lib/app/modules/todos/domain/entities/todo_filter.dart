import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_filter.freezed.dart';

/// State of filtered todos
enum TodoState {
  ///
  both,

  ///
  done,

  ///
  todo
}

/// Constract of todo filter
abstract class TodoFilter {
  TodoState get state;
}

/// Domain implementation of todo filter
@freezed
class TodoFilterEntity with _$TodoFilterEntity implements TodoFilter {
  factory TodoFilterEntity({@Default(TodoState.both) TodoState state}) =
      _TodosFilterEntity;

  factory TodoFilterEntity.done() => TodoFilterEntity(state: TodoState.done);
  factory TodoFilterEntity.todo() => TodoFilterEntity(state: TodoState.todo);
}
