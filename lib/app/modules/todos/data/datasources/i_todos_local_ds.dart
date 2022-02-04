import 'package:dartz/dartz.dart';
import 'package:todo1st/app/core/errors/index.dart';
import 'package:todo1st/app/modules/todos/data/models/index.dart';

///
abstract class ITodosLocalDS {
  ///
  Stream<Either<Failure, List<TaskModel>>> list(String filter);

  ///
  Future<Either<Failure, Unit>> save(TaskModel model);
}
