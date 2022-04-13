import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_memory.dart';
import 'package:todo1st/app/modules/todos/data/datasources/index.dart';
import 'package:todo1st/app/shared/data/datasources/index.dart';
import 'package:uuid/uuid.dart';

import '../../../../../constants.dart';
import '../../../../../mocks.dart';

void main() {
  late Uuid uuid;
  late Database database;
  late IKeyDS keyDS;
  late StoreRef store;
  late ITodosLocalDS localDS;

  setUpAll(() async {
    disableSembastCooperator();

    uuid = UuidMock();
    keyDS = KeyUuidDS(uuid);
    database =
        await databaseFactoryMemory.openDatabase(sembastInMemoryDatabasePath);
    localDS = TodosSembastDS(database, keyDS);

    store = stringMapStoreFactory.store(todosStoreName);
  });

  tearDownAll(() async {
    await database.close();
  });

  tearDown(() async {
    await store.delete(database);
  });

  test('should count sucessfully', () async {
    await store.record(kUid).put(database, kTodoMap);
    await store.record(kNewUid).put(database, kNewTodoMap);

    final result = await localDS.count(fFilterAll);
    expect(result.isRight(), true);
    expect(
      result.getOrElse(() => kCountMap),
      {'available': 1, 'done': 1, 'all': 2},
    );
  });

  test('should list 2, using filter both', () async {
    await store.record(kUid).put(database, kTodoMap);
    await store.record(kNewUid).put(database, kNewTodoMap);

    final result = await localDS.list(fFilterAll).first;
    expect(result.isRight(), true);
    expect(result.getOrElse(() => []).length, 2);
  });

  test('should list 1, using filter done', () async {
    await store.record(kUid).put(database, kTodoMap);
    await store.record(kNewUid).put(database, kNewTodoMap);

    final result = await localDS.list(fFilterDone).first;
    expect(result.isRight(), true);
    expect(result.getOrElse(() => []).length, 1);
  });

  test('should list 0, using filter todo', () async {
    await store.record(kUid).put(database, kTodoMap);

    final result = await localDS.list(fFilterAvailable).first;
    expect(result.isRight(), true);
    expect(result.getOrElse(() => []).length, 0);
  });

  test('should create', () async {
    when(() => uuid.v1()).thenReturn(kNewUid);

    final result = await localDS.save(kNewTodoMap);
    expect(result.isRight(), true);
  });

  test('should update', () async {
    await store.record(kUid).put(database, kTodoMap);

    final result = await localDS.save(kTodoUpdatedMap);
    expect(result.isRight(), true);
  });

  test('should read successfully', () async {
    await store.record(kUid).put(database, kTodoMap);

    final result = await localDS.read(kUid);
    expect(result.isRight(), true);
  });

  test('should read nothing', () async {
    final result = await localDS.read(kUid);
    expect(result.isLeft(), true);
  });
}
