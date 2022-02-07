import 'package:freezed_annotation/freezed_annotation.dart';

part 'todos_state.freezed.dart';

@freezed
class TodosState with _$TodosState {
  factory TodosState({
    @Default('') String filter,
    required DateTime lastModified,
  }) = _TodosState;

  factory TodosState.initial() => TodosState(lastModified: DateTime.now());
}
