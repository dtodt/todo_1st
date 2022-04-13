import 'package:dartz/dartz.dart';
import 'package:todo1st/app/core/index.dart';
import 'package:todo1st/app/modules/todos/domain/index.dart';

///
abstract class ITodosRepository {
  ///
  Stream<Either<Failure, List<TodoEntity>>> list(TodoFilter filter);

  ///
  Future<Either<Failure, TodoEntity>> read(String uid);

  ///
  Future<Either<Failure, Unit>> save(TodoEntity entity);
}
