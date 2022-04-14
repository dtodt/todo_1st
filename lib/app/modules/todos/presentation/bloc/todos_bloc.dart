import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:meta/meta.dart';
import 'package:todo1st/app/modules/todos/domain/index.dart';

part 'todos_event.dart';
part 'todos_state.dart';

class TodosBloc extends Bloc<TodosEvent, TodosState> {
  final ITodosAdd _addUsecase;
  final ITodosCheck _checkUsecase;
  final ITodosFetch _fetchUsecase;

  TodosBloc(
    this._addUsecase,
    this._checkUsecase,
    this._fetchUsecase,
  ) : super(TodosInitial()) {
    on<TodosAddEvent>(_addTodo, transformer: sequential());
    on<TodosCheckEvent>(_checkTodo, transformer: sequential());
    on<TodosFetchEvent>(_fetchTodos, transformer: restartable());
  }

  Future<void> _addTodo(TodosAddEvent event, _) async {
    await _addUsecase(event.todo);
  }

  Future<void> _checkTodo(
      TodosCheckEvent event, Emitter<TodosState> emit) async {
    await _checkUsecase(event.check);
  }

  Future<void> _fetchTodos(
      TodosFetchEvent event, Emitter<TodosState> emit) async {
    emit(TodosLoading());
    await emit.onEach<List<TodoEntity>>(
      _fetchUsecase(event.filter),
      onData: (data) => emit(TodosLoaded(data)),
      onError: (_, stack) => emit(TodosFailed(stack.toString())),
    );
  }
}
