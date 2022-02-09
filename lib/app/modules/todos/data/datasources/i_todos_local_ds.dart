import 'package:dartz/dartz.dart';
import 'package:todo1st/app/core/errors/index.dart';
import 'package:todo1st/app/modules/todos/data/models/index.dart';

///
abstract class ITodosLocalDS {
  ///
  Stream<Either<Failure, int>> count(TodoFilterModel filter);

  ///
  Stream<Either<Failure, List<TodoModel>>> list(TodoFilterModel filter);

  ///
  Future<Either<Failure, TodoModel>> read(String uid);

  ///
  Future<Either<Failure, Unit>> save(TodoModel model);
}
