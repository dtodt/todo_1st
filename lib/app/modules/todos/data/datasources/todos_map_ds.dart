import 'package:dartz/dartz.dart';
import 'package:todo1st/app/core/errors/failure.dart';
import 'package:todo1st/app/modules/todos/data/models/task_model.dart';

import 'i_todos_local_ds.dart';

///
class TodosMapDS implements ITodosLocalDS {
  final Map<String, TaskModel> _map;

  const TodosMapDS({
    Map<String, TaskModel> map = const {},
  }) : _map = map;

  @override
  Stream<Either<Failure, List<TaskModel>>> list(String filter) {
    final filtered = _map.values.toList();
    final Either<Failure, List<TaskModel>> result =
        filtered.isEmpty ? Left(Failure()) : Right(filtered);

    return Stream.fromIterable([result]);
  }

  @override
  Future<Either<Failure, Unit>> save(TaskModel model) {
    // TODO: implement save
    throw UnimplementedError();
  }
}
