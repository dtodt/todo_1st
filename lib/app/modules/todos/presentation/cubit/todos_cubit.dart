import 'package:bloc/bloc.dart';
import 'package:todo1st/app/modules/todos/data/index.dart';
import 'package:todo1st/app/modules/todos/domain/entities/index.dart';
import 'package:todo1st/app/modules/todos/domain/usecases/index.dart';

import 'todos_state.dart';

///
class TodosCubit extends Cubit<TodosState> {
  final ITodosCount _todosCount;
  final ITodosList _todosList;
  final ITodosRead _todosRead;
  final ITodosSave _todosSave;

  TodosCubit(
    this._todosCount,
    this._todosList,
    this._todosRead,
    this._todosSave,
  ) : super(TodosState.initial());

  Future<void> add(String description) async {
    final model = TodoModel.empty().copyWith(description: description);
    await save(model);
  }

  Future<TodoCountEntity> count(TodoFilterEntity filter) {
    return _todosCount(filter);
  }

  Stream<List<TodoEntity>> list(TodoFilterEntity filter) {
    return _todosList(filter);
  }

  Future<void> save(TodoEntity entity) async {
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
      await save(TodoEntity(
        description: task.description,
        done: checked,
        uid: task.uid,
      ));
    });
  }
}
