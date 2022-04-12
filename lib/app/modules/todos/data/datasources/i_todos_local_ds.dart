import 'package:dartz/dartz.dart';
import 'package:todo1st/app/core/errors/index.dart';
import 'package:todo1st/app/modules/todos/domain/index.dart';

const todosStoreName = 'todos';

///
abstract class ITodosLocalDS {
  ///
  Future<Either<Failure, Map<String, dynamic>>> count(TodoFilterEntity filter);

  ///
  Stream<Either<Failure, List<Map<String, dynamic>>>> list(
      TodoFilterEntity filter);

  ///
  Future<Either<Failure, Map<String, dynamic>>> read(String uid);

  ///
  Future<Either<Failure, Unit>> save(Map<String, dynamic> model);
}
