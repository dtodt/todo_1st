import 'package:dartz/dartz.dart';
import 'package:todo1st/app/core/errors/index.dart';
import 'package:todo1st/app/modules/todos/data/datasources/index.dart';
import 'package:todo1st/app/modules/todos/domain/entities/index.dart';
import 'package:todo1st/app/modules/todos/domain/repositories/index.dart';

///
class TodosRepository implements ITodosRepository {
  final ITodosLocalDS _localDS;

  const TodosRepository(this._localDS);

  ///
  @override
  Stream<Either<Failure, List<TaskEntity>>> list(String filter) {
    return _localDS.list(filter);
  }

  ///
  @override
  Future<Either<Failure, Unit>> save(TaskEntity entity) {
    // TODO: implement save
    throw UnimplementedError();
  }
}
