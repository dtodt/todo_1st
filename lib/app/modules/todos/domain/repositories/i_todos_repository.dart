import 'package:dartz/dartz.dart';
import 'package:todo1st/app/core/errors/index.dart';
import 'package:todo1st/app/modules/todos/domain/entities/index.dart';

///
abstract class ITodosRepository {
  ///
  Future<Either<Failure, TodoCountEntity>> count(TodoFilterEntity filter);

  ///
  Stream<Either<Failure, List<TodoEntity>>> list(TodoFilterEntity filter);

  ///
  Future<Either<Failure, TodoEntity>> read(String uid);

  ///
  Future<Either<Failure, Unit>> save(TodoEntity entity);
}
