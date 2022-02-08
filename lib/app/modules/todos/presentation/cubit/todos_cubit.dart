import 'package:bloc/bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo1st/app/modules/todos/domain/entities/index.dart';
import 'package:todo1st/app/modules/todos/domain/usecases/index.dart';

import 'todos_state.dart';

part 'todos_cubit.g.dart';

///
@Injectable(lazy: true, singleton: false)
class TodosCubit extends Cubit<TodosState> {
  final TodosCount _todosCount;
  final TodosList _todosList;
  final TodosRead _todosRead;
  final TodosSave _todosSave;

  TodosCubit(
    this._todosCount,
    this._todosList,
    this._todosRead,
    this._todosSave,
  ) : super(TodosState.initial());

  Future<void> add(String taskDescription) async {
    await save(TaskEntity(description: taskDescription));
  }

  Stream<int> count(String filter) {
    return _todosCount(filter);
  }

  Stream<List<TaskEntity>> list(String filter) {
    return _todosList(filter);
  }

  Future<void> save(TaskEntity entity) async {
    await _todosSave(entity);
    // Little hack to update the stream,
    // does not work properly beacuse the list method in datasource
    emit(state.copyWith(lastModified: DateTime.now()));
  }

  Future<void> taskDone(String uid, bool checked) async {
    final result = await _todosRead(uid);
    result.fold((failure) {
      /// TODO this should never happen, but we should log here just in case.
    }, (task) async {
      await save(TaskEntity(
        description: task.description,
        done: checked,
        uid: task.uid,
      ));
    });
  }
}
