import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo1st/app/modules/todos/domain/entities/index.dart';

part 'todos_state.freezed.dart';

@freezed
class TodosState with _$TodosState {
  factory TodosState({
    required TodoFilter filter,
    required DateTime lastModified,
  }) = _TodosState;

  factory TodosState.initial() =>
      TodosState(filter: TodoFilterEntity(), lastModified: DateTime.now());
}
