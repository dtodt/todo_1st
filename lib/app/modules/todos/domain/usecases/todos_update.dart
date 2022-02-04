import 'package:dartz/dartz.dart';
import 'package:todo1st/app/core/mixins/usecases.dart';
import 'package:todo1st/app/modules/todos/domain/entities/index.dart';
import 'package:todo1st/app/modules/todos/domain/repositories/index.dart';

///
class TodosUpdate with FutureUseCase<Unit, TodoTask> {
  final ITodosRepository repository;

  const TodosUpdate(this.repository);

  @override
  Future<Unit> call(TodoTask params) async {
    await repository.update(params);

    return unit;
  }
}
