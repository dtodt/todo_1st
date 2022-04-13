part of 'todos_bloc.dart';

@immutable
abstract class TodosEvent {}

class TodosAddEvent implements TodosEvent {
  final TodoEntity todo;

  const TodosAddEvent(this.todo);
}

class TodosCheckEvent implements TodosEvent {
  final TodoCheck check;

  const TodosCheckEvent(this.check);
}

class TodosFetchEvent implements TodosEvent {
  final TodoFilter filter;

  const TodosFetchEvent(this.filter);
}
