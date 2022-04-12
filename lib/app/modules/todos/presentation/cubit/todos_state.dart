import 'package:todo1st/app/modules/todos/domain/entities/index.dart';

class TodosState {
  final TodoFilterEntity filter;
  final DateTime lastModified;

  const TodosState({
    required this.filter,
    required this.lastModified,
  });

  factory TodosState.initial() {
    return TodosState(
      filter: TodoFilterEntity.all(),
      lastModified: DateTime.now(),
    );
  }

  TodosState copyWith({
    TodoFilterEntity? filter,
    DateTime? lastModified,
  }) {
    return TodosState(
      filter: filter ?? this.filter,
      lastModified: lastModified ?? this.lastModified,
    );
  }
}
