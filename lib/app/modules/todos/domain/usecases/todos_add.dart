import 'package:dartz/dartz.dart';
import 'package:todo1st/app/core/index.dart';
import 'package:todo1st/app/modules/todos/domain/index.dart';

///
abstract class ITodosAdd with FutureUseCase<Unit, TodoEntity> {}

///
class TodosAdd implements ITodosAdd {
  final ITodosRepository repository;

  const TodosAdd(this.repository);

  @override
  Future<Unit> call(TodoEntity params) async {
    await repository.save(params);
    return unit;
  }
}
