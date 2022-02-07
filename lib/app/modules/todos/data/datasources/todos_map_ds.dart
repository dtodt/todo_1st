import 'package:dartz/dartz.dart';
import 'package:todo1st/app/core/errors/index.dart';
import 'package:todo1st/app/modules/todos/data/models/index.dart';

import 'i_todos_local_ds.dart';

///
class TodosMapDS implements ITodosLocalDS {
  final Map<String, TaskModel> _map;

  const TodosMapDS({
    Map<String, TaskModel> map = const {},
  }) : _map = map;

  @override
  Stream<Either<Failure, int>> count(String filter) {
    return Stream.value(_map.isEmpty ? Left(Failure()) : Right(_map.length));
  }

  @override
  Stream<Either<Failure, List<TaskModel>>> list(String filter) {
    final filtered = _map.values.toList();
    final Either<Failure, List<TaskModel>> result =
        filtered.isEmpty ? Left(Failure()) : Right(filtered);

    return Stream.fromIterable([result]);
  }

  @override
  Future<Either<Failure, Unit>> save(TaskModel model) async {
    _map[model.uid] = model;
    return const Right(unit);
  }

  @override
  Future<Either<Failure, TaskModel>> read(String filter) async {
    if (_map.containsKey(filter)) {
      return Right(_map[filter]!);
    }
    return Left(Failure());
  }
}
