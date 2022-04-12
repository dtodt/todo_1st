import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:sembast/sembast.dart';
import 'package:todo1st/app/core/errors/index.dart';
import 'package:todo1st/app/modules/todos/domain/entities/index.dart';
import 'package:todo1st/app/shared/data/datasources/index.dart';

import 'i_todos_local_ds.dart';

class TodosSembastDS implements ITodosLocalDS {
  final Database _db;
  final IKeyDS _keyDS;
  late StoreRef _store;

  final availableFilter = Filter.equals('done', false);
  final doneFilter = Filter.equals('done', true);

  TodosSembastDS(this._db, this._keyDS) {
    _store = stringMapStoreFactory.store(todosStoreName);
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> count(
      TodoFilterEntity filter) async {
    final int available = await _store.count(_db, filter: availableFilter);
    final int done = await _store.count(_db, filter: doneFilter);
    final int all = await _store.count(_db);

    return Right({
      'all': all,
      'available': available,
      'done': done,
    });
  }

  @override
  Stream<Either<Failure, List<Map<String, dynamic>>>> list(
      TodoFilterEntity filter) {
    Filter? dbFilter;
    if (TodoState.done == filter.state) {
      dbFilter = doneFilter;
    }
    if (TodoState.available == filter.state) {
      dbFilter = availableFilter;
    }

    final finder = Finder(filter: dbFilter);
    final transformer = StreamTransformer<
        List<RecordSnapshot<dynamic, dynamic>>,
        Either<Failure, List<Map<String, dynamic>>>>.fromHandlers(
      handleData: _handleData,
    );

    return _store.query(finder: finder).onSnapshots(_db).transform(transformer);
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> read(String uid) async {
    final result = await _store.record(uid).get(_db);
    if (result == null) {
      return const Left(Failure());
    }

    final json = result as Map<String, dynamic>;
    return Right(json);
  }

  @override
  Future<Either<Failure, Unit>> save(Map<String, dynamic> model) async {
    await _store.record(model['uid']).put(_db, model);
    return const Right(unit);
  }

  void _handleData(List<RecordSnapshot> data,
      EventSink<Either<Failure, List<Map<String, dynamic>>>> sink) {
    final List<Map<String, dynamic>> models = [];
    for (var record in data) {
      models.add(record.value);
    }
    sink.add(Right(models));
  }
}
