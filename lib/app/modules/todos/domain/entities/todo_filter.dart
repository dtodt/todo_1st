import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_filter.freezed.dart';

/// State of filtered todos
enum TodoState {
  ///
  all,

  ///
  available,

  ///
  done,
}

/// Constract of todo filter
abstract class TodoFilter {
  TodoState get state;
}

/// Domain implementation of todo filter
@freezed
class TodoFilterEntity with _$TodoFilterEntity implements TodoFilter {
  factory TodoFilterEntity({@Default(TodoState.all) TodoState state}) =
      _TodosFilterEntity;

  factory TodoFilterEntity.done() => TodoFilterEntity(state: TodoState.done);
  factory TodoFilterEntity.available() =>
      TodoFilterEntity(state: TodoState.available);
}
