import 'package:dartz/dartz.dart';
import 'package:todo1st/app/core/index.dart';
import 'package:todo1st/app/modules/todos/data/index.dart';
import 'package:todo1st/app/modules/todos/domain/index.dart';

class TodosRepository implements ITodosRepository {
  final ITodosLocalDS _localDS;

  const TodosRepository(this._localDS);

  ///
  @override
  Stream<Either<Failure, List<TodoEntity>>> list(TodoFilter filter) async* {
    final stream = _localDS.list(filter);

    yield* stream.map(
      (listOrFailure) => listOrFailure.fold(
        (failure) => Left(failure),
        (list) => Right(TodoEntityAdapter.fromList(list)),
      ),
    );
  }

  ///
  @override
  Future<Either<Failure, TodoEntity>> read(String filter) async {
    final entityOrFailure = await _localDS.read(filter);

    return entityOrFailure.fold(
      (failure) => Left(failure),
      (entity) => Right(TodoEntityAdapter.fromJson(entity)),
    );
  }

  ///
  @override
  Future<Either<Failure, Unit>> save(TodoEntity entity) async {
    return await _localDS.save(TodoEntityAdapter.toJson(entity));
  }
}
