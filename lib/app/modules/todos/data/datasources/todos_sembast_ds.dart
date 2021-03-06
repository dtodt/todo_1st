import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:sembast/sembast.dart';
import 'package:todo1st/app/core/index.dart';
import 'package:todo1st/app/modules/todos/domain/index.dart';
import 'package:todo1st/app/shared/data/index.dart';

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
  Stream<Either<Failure, List<Map<String, dynamic>>>> list(TodoFilter filter) {
    Filter? dbFilter;
    if (TodoStatus.done == filter.status) {
      dbFilter = doneFilter;
    }
    if (TodoStatus.available == filter.status) {
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
    return Right(_fromStore(uid, result));
  }

  @override
  Future<Either<Failure, Unit>> save(Map<String, dynamic> model) async {
    final uid = _getUid(model['uid']);
    await _store.record(uid).put(_db, _toStore(model));
    return const Right(unit);
  }

  String _getUid(String uid) {
    return uid.isNotEmpty ? uid : _keyDS.getKey();
  }

  void _handleData(List<RecordSnapshot> data,
      EventSink<Either<Failure, List<Map<String, dynamic>>>> sink) {
    final List<Map<String, dynamic>> models = [];
    for (var record in data) {
      models.add(_fromStore(record.key, record.value));
    }
    sink.add(Right(models));
  }

  Map<String, dynamic> _fromStore(dynamic uid, Map<String, dynamic> value) {
    return {
      'uid': uid,
      'description': value['description'],
      'done': value['done'],
    };
  }

  Map<String, dynamic> _toStore(Map<String, dynamic> value) {
    return {
      'description': value['description'],
      'done': value['done'],
    };
  }
}
