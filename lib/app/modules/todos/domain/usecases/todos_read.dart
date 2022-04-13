import 'package:dartz/dartz.dart';
import 'package:todo1st/app/core/errors/index.dart';
import 'package:todo1st/app/core/mixins/index.dart';
import 'package:todo1st/app/modules/todos/domain/entities/index.dart';
import 'package:todo1st/app/modules/todos/domain/repositories/index.dart';

///
abstract class ITodosRead
    with FutureUseCase<Either<Failure, TodoEntity>, String> {}

///
class TodosRead implements ITodosRead {
  final ITodosRepository repository;

  const TodosRead(this.repository);

  @override
  Future<Either<Failure, TodoEntity>> call(String params) async {
    return await repository.read(params);
  }
}
