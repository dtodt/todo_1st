import 'package:bloc/bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo1st/app/modules/todos/domain/entities/index.dart';
import 'package:todo1st/app/modules/todos/domain/usecases/index.dart';

part 'todos_cubit.g.dart';

///
@Injectable(lazy: true, singleton: false)
class TodosCubit extends Cubit<String> {
  final TodosList _todosList;
  final TodosSave _todosSave;

  TodosCubit(this._todosList, this._todosSave) : super('');

  void filter(String filter) => emit(filter);

  Stream<List<TaskEntity>> list() {
    return _todosList(state);
  }

  Future<void> save(TaskEntity entity) async {
    await _todosSave(entity);
  }
}