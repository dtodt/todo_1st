import 'package:dartz/dartz.dart';
import 'package:todo1st/app/core/errors/index.dart';
import 'package:todo1st/app/modules/todos/domain/entities/index.dart';

///
abstract class ITodosRepository {
  ///
  Stream<Either<Failure, int>> count(TodoFilter filter);

  ///
  Stream<Either<Failure, List<Todo>>> list(TodoFilter filter);

  ///
  Future<Either<Failure, Todo>> read(String uid);

  ///
  Future<Either<Failure, Unit>> save(Todo entity);
}
