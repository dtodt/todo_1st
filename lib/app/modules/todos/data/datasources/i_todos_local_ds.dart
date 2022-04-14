import 'package:dartz/dartz.dart';
import 'package:todo1st/app/core/index.dart';
import 'package:todo1st/app/modules/todos/domain/index.dart';

const todosStoreName = 'todos';

///
abstract class ITodosLocalDS {
  ///
  Stream<Either<Failure, List<Map<String, dynamic>>>> list(TodoFilter filter);

  ///
  Future<Either<Failure, Map<String, dynamic>>> read(String uid);

  ///
  Future<Either<Failure, Unit>> save(Map<String, dynamic> model);
}
