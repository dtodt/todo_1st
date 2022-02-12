import 'package:dartz/dartz.dart';
import 'package:todo1st/app/core/errors/index.dart';
import 'package:todo1st/app/modules/todos/data/models/index.dart';
import 'package:todo1st/app/modules/todos/domain/entities/index.dart';

import 'i_todos_local_ds.dart';

///
class TodosMapDS implements ITodosLocalDS {
  final Map<String, TodoModel> _map;

  const TodosMapDS({
    required Map<String, TodoModel> map,
  }) : _map = map;

  @override
  Future<Either<Failure, TodoCountModel>> count(TodoFilterModel filter) async {
    return Right(_map.values.fold<TodoCountModel>(
      TodoCountModel(),
      (count, todo) {
        int available = count.available;
        int done = count.done;
        int total = count.total + 1;
        if (todo.done) {
          done += 1;
        } else {
          available += 1;
        }
        return count.copyWith(available: available, done: done, total: total);
      },
    ));
  }

  @override
  Stream<Either<Failure, List<TodoModel>>> list(TodoFilterModel filter) {
    Either<Failure, List<TodoModel>> value;
    if (TodoState.both == filter.state) {
      value = Right(_map.values.toList());
    } else {
      final filtered = _map.values.toList().where(
            (todo) => todo.done == (TodoState.done == filter.state),
          );
      value = Right(filtered.toList());
    }

    return Stream.value(value);
  }

  @override
  Future<Either<Failure, TodoModel>> read(String filter) async {
    if (_map.containsKey(filter)) {
      return Right(_map[filter]!);
    }
    return Left(Failure());
  }

  @override
  Future<Either<Failure, Unit>> save(TodoModel model) async {
    _map[model.uid] = model;
    return const Right(unit);
  }
}
