import 'package:dartz/dartz.dart';
import 'package:todo1st/app/core/errors/index.dart';
import 'package:todo1st/app/modules/todos/domain/entities/index.dart';

///
abstract class ITodosRepository {
  ///
  Stream<Either<Failure, List<TaskEntity>>> list(String params);

  ///
  Future<Either<Failure, Unit>> save(TaskEntity params);
}
