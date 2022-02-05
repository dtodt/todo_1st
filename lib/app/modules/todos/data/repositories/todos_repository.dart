import 'package:dartz/dartz.dart';
import 'package:todo1st/app/core/errors/index.dart';
import 'package:todo1st/app/modules/todos/data/datasources/index.dart';
import 'package:todo1st/app/modules/todos/data/models/index.dart';
import 'package:todo1st/app/modules/todos/domain/entities/index.dart';
import 'package:todo1st/app/modules/todos/domain/repositories/index.dart';
import 'package:uuid/uuid.dart';

///
class TodosRepository implements ITodosRepository {
  final ITodosLocalDS _localDS;
  final Uuid _uuid;

  const TodosRepository(
    this._localDS, {
    Uuid uuid = const Uuid(),
  }) : _uuid = uuid;

  ///
  @override
  Stream<Either<Failure, List<TaskEntity>>> list(String filter) {
    return _localDS.list(filter);
  }

  ///
  @override
  Future<Either<Failure, Unit>> save(TaskEntity entity) async {
    final TaskModel model = TaskModel(
      description: entity.description,
      done: entity.done,
      uid: _getUid(entity.uid),
    );
    return await _localDS.save(model);
  }

  String _getUid(String uid) {
    return uid.isNotEmpty ? uid : _uuid.v1();
  }
}
