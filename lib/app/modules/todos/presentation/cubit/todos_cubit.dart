import 'package:bloc/bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo1st/app/modules/todos/domain/entities/index.dart';
import 'package:todo1st/app/modules/todos/domain/usecases/index.dart';

import 'todos_state.dart';

part 'todos_cubit.g.dart';

///
@Injectable(lazy: true, singleton: false)
class TodosCubit extends Cubit<TodosState> {
  final TodosList _todosList;
  final TodosSave _todosSave;

  TodosCubit(this._todosList, this._todosSave) : super(TodosState.initial());

  Future<void> add(String taskDescription) async {
    await save(TaskEntity(description: taskDescription));
  }

  void filter(String filter) => emit(state.copyWith(filter: filter));

  Stream<List<TaskEntity>> list() {
    return _todosList(state.filter);
  }

  Future<void> save(TaskEntity entity) async {
    await _todosSave(entity);
    // Little hack to update the stream,
    // does not work properly beacuse the list method in datasource
    emit(state.copyWith(lastModified: DateTime.now()));
  }

  Future<void> taskDone(String uid, bool checked) async {
    /// TODO implement it when refactoring save usecase
  }
}
