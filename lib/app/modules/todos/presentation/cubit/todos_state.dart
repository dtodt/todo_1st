import 'package:todo1st/app/modules/todos/data/index.dart';
import 'package:todo1st/app/modules/todos/domain/index.dart';

class TodosState {
  final TodoFilterEntity filter;
  final DateTime lastModified;

  const TodosState({
    required this.filter,
    required this.lastModified,
  });

  factory TodosState.initial() {
    return TodosState(
      filter: TodoFilterModel.all(),
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
