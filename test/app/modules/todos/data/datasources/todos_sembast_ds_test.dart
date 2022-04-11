import 'package:flutter_test/flutter_test.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_memory.dart';
import 'package:todo1st/app/modules/todos/data/datasources/index.dart';
import 'package:todo1st/app/modules/todos/data/models/index.dart';

import '../../../../../constants/index.dart';

void main() {
  late Database database;
  late StoreRef store;
  late ITodosLocalDS localDS;

  setUpAll(() async {
    disableSembastCooperator();

    database =
        await databaseFactoryMemory.openDatabase(sembastInMemoryDatabasePath);
    localDS = TodosSembastDS(database);

    store = stringMapStoreFactory.store(todosStoreName);
  });

  tearDownAll(() async {
    await database.close();
  });

  tearDown(() async {
    await store.delete(database);
  });

  test('should count sucessfully', () async {
    await store.record(kUid).put(database, fTodo.toJson());
    await store.record(kNewUid).put(database, fNewTodoUpdated.toJson());

    final result = await localDS.count(fFilterAll);
    expect(result.isRight(), true);
    expect(
      result.getOrElse(() => TodoCountModel()),
      TodoCountModel(available: 1, done: 1, all: 2),
    );
  });

  test('should list 2, using filter both', () async {
    await store.record(kUid).put(database, fTodo.toJson());
    await store.record(kNewUid).put(database, fNewTodoUpdated.toJson());

    final result = await localDS.list(fFilterAll).first;
    expect(result.isRight(), true);
    expect(result.getOrElse(() => []).length, 2);
  });

  test('should list 1, using filter done', () async {
    await store.record(kUid).put(database, fTodo.toJson());
    await store.record(kNewUid).put(database, fNewTodoUpdated.toJson());

    final result = await localDS.list(fFilterDone).first;
    expect(result.isRight(), true);
    expect(result.getOrElse(() => []).length, 1);
  });

  test('should list 0, using filter todo', () async {
    await store.record(kUid).put(database, fTodo.toJson());

    final result = await localDS.list(fFilterAvailable).first;
    expect(result.isRight(), true);
    expect(result.getOrElse(() => []).length, 0);
  });

  test('should create', () async {
    final result = await localDS.save(fNewTodoUpdated);
    expect(result.isRight(), true);

    final record = await store.record(kNewUid).get(database);
    expect(TodoModel.fromJson(record), fNewTodoUpdated);
  });

  test('should update', () async {
    await store.record(kUid).put(database, fTodo.toJson());

    final updated = fTodo.copyWith(done: false);

    final result = await localDS.save(updated);
    expect(result.isRight(), true);

    final record = await store.record(kUid).get(database);
    expect(TodoModel.fromJson(record), updated);
  });

  test('should read successfully', () async {
    await store.record(kUid).put(database, fTodo.toJson());

    final result = await localDS.read(kUid);
    expect(result.isRight(), true);
  });

  test('should read nothing', () async {
    final result = await localDS.read(kUid);
    expect(result.isLeft(), true);
  });
}
