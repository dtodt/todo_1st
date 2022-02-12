import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sembast/sembast.dart';
import 'package:todo1st/app/core/errors/index.dart';
import 'package:todo1st/app/modules/todos/data/models/index.dart';
import 'package:todo1st/app/modules/todos/domain/entities/index.dart';

import 'i_todos_local_ds.dart';

part 'todos_sembast_ds.g.dart';

///
@Injectable(lazy: true, singleton: false)
class TodosSembastDS implements ITodosLocalDS {
  final Database _db;
  late StoreRef _store;

  final availableFilter = Filter.equals('done', false);
  final doneFilter = Filter.equals('done', true);

  TodosSembastDS(this._db) {
    _store = stringMapStoreFactory.store(todosStoreName);
  }

  @override
  Future<Either<Failure, TodoCountModel>> count(TodoFilterModel filter) async {
    final int available = await _store.count(_db, filter: availableFilter);
    final int done = await _store.count(_db, filter: doneFilter);
    final int total = await _store.count(_db);

    return Right(TodoCountModel(
      available: available,
      done: done,
      total: total,
    ));
  }

  @override
  Stream<Either<Failure, List<TodoModel>>> list(TodoFilterModel filter) {
    Filter? dbFilter;
    if (TodoState.done == filter.state) {
      dbFilter = doneFilter;
    }
    if (TodoState.todo == filter.state) {
      dbFilter = availableFilter;
    }

    final finder = Finder(filter: dbFilter);
    final transformer = StreamTransformer<
        List<RecordSnapshot<dynamic, dynamic>>,
        Either<Failure, List<TodoModel>>>.fromHandlers(
      handleData: _handleData,
    );

    return _store.query(finder: finder).onSnapshots(_db).transform(transformer);
  }

  @override
  Future<Either<Failure, TodoModel>> read(String uid) async {
    final result = await _store.record(uid).get(_db);
    if (result == null) {
      return Left(Failure());
    }

    final json = result as Map<String, dynamic>;
    return Right(TodoModel.fromJson(json));
  }

  @override
  Future<Either<Failure, Unit>> save(TodoModel model) async {
    await _store.record(model.uid).put(_db, model.toJson());
    return const Right(unit);
  }

  void _handleData(List<RecordSnapshot> data,
      EventSink<Either<Failure, List<TodoModel>>> sink) {
    final List<TodoModel> models = [];
    for (var record in data) {
      models.add(TodoModel.fromJson(record.value));
    }
    sink.add(Right(models));
  }
}
