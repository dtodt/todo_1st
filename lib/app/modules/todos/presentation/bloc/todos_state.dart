part of 'todos_bloc.dart';

@immutable
abstract class TodosState {}

class TodosInitial implements TodosState {}

class TodosLoading implements TodosState {}

class TodosLoaded implements TodosState {
  final List<TodoEntity> todos;

  const TodosLoaded(this.todos);
}

class TodosFailed implements TodosState {
  final String message;

  const TodosFailed(this.message);
}
