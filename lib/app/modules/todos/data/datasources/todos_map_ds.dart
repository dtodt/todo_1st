import 'package:dartz/dartz.dart';
import 'package:todo1st/app/core/errors/index.dart';
import 'package:todo1st/app/modules/todos/data/models/index.dart';

import 'i_todos_local_ds.dart';

///
class TodosMapDS implements ITodosLocalDS {
  final Map<String, TodoModel> _map;

  const TodosMapDS({
    required Map<String, TodoModel> map,
  }) : _map = map;

  @override
  Stream<Either<Failure, int>> count(TodoFilterModel filter) {
    return Stream.value(_map.isEmpty ? Left(Failure()) : Right(_map.length));
  }

  @override
  Stream<Either<Failure, List<TodoModel>>> list(TodoFilterModel filter) {
    final filtered = _map.values.toList();
    final Either<Failure, List<TodoModel>> result =
        filtered.isEmpty ? Left(Failure()) : Right(filtered);

    return Stream.fromIterable([result]);
  }

  @override
  Future<Either<Failure, Unit>> save(TodoModel model) async {
    _map[model.uid] = model;
    return const Right(unit);
  }

  @override
  Future<Either<Failure, TodoModel>> read(String filter) async {
    if (_map.containsKey(filter)) {
      return Right(_map[filter]!);
    }
    return Left(Failure());
  }
}
