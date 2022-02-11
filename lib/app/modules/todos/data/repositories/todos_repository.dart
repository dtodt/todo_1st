import 'package:dartz/dartz.dart';
import 'package:todo1st/app/core/errors/index.dart';
import 'package:todo1st/app/modules/todos/data/datasources/index.dart';
import 'package:todo1st/app/modules/todos/data/models/index.dart';
import 'package:todo1st/app/modules/todos/domain/entities/index.dart';
import 'package:todo1st/app/modules/todos/domain/repositories/index.dart';
import 'package:todo1st/app/shared/data/datasources/index.dart';

///
class TodosRepository implements ITodosRepository {
  final ITodosLocalDS _localDS;
  final IKeyDS _keyDS;

  const TodosRepository(this._localDS, this._keyDS);

  ///
  @override
  Future<Either<Failure, TodoCount>> count(TodoFilter filter) async {
    return await _localDS.count(TodoFilterModel.fromEntity(filter));
  }

  ///
  @override
  Stream<Either<Failure, List<Todo>>> list(TodoFilter filter) {
    return _localDS.list(TodoFilterModel.fromEntity(filter));
  }

  ///
  @override
  Future<Either<Failure, Todo>> read(String filter) async {
    return await _localDS.read(filter);
  }

  ///
  @override
  Future<Either<Failure, Unit>> save(Todo entity) async {
    final TodoModel model = TodoModel.fromEntity(entity).copyWith(
      uid: _getUid(entity.uid),
    );
    return await _localDS.save(model);
  }

  String _getUid(String uid) {
    return uid.isNotEmpty ? uid : _keyDS.getKey();
  }
}
