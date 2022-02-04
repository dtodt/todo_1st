import 'package:dartz/dartz.dart';
import 'package:todo1st/app/core/errors/index.dart';
import 'package:todo1st/app/modules/todos/domain/entities/todo_task.dart';

///
abstract class ITodosRepository {
  ///
  Stream<Either<Failure, List<TodoTask>>> list(String params);
}
