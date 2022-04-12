import 'package:dartz/dartz.dart';
import 'package:todo1st/app/core/errors/index.dart';
import 'package:todo1st/app/modules/todos/data/adapters/todo_count_adapter.dart';
import 'package:todo1st/app/modules/todos/data/adapters/todo_entity_adapter.dart';
import 'package:todo1st/app/modules/todos/data/datasources/index.dart';
import 'package:todo1st/app/modules/todos/domain/entities/index.dart';
import 'package:todo1st/app/modules/todos/domain/repositories/index.dart';

class TodosRepository implements ITodosRepository {
  final ITodosLocalDS _localDS;

  const TodosRepository(this._localDS);

  ///
  @override
  Future<Either<Failure, TodoCountEntity>> count(
      TodoFilterEntity filter) async {
    final countOrFailure = await _localDS.count(filter);
    return countOrFailure.fold(
      (failure) => Left(failure),
      (count) => Right(TodoCountAdapter.fromJson(count)),
    );
  }

  ///
  @override
  Stream<Either<Failure, List<TodoEntity>>> list(
      TodoFilterEntity filter) async* {
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
