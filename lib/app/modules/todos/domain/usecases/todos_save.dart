import 'package:dartz/dartz.dart';
import 'package:todo1st/app/core/mixins/index.dart';
import 'package:todo1st/app/modules/todos/domain/entities/index.dart';
import 'package:todo1st/app/modules/todos/domain/repositories/index.dart';

///
abstract class ITodosSave with FutureUseCase<Unit, TodoEntity> {}

///
class TodosSave implements ITodosSave {
  final ITodosRepository repository;

  const TodosSave(this.repository);

  @override
  Future<Unit> call(TodoEntity params) async {
    await repository.save(params);
    return unit;
  }
}
