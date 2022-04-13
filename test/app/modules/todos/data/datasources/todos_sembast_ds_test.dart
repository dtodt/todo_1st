import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_memory.dart';
import 'package:todo1st/app/modules/todos/data/index.dart';
import 'package:todo1st/app/modules/todos/domain/index.dart';
import 'package:todo1st/app/shared/data/index.dart';
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

  test('should list 2, using filter both', () async {
    await store.record(kUid).put(database, kTodoDoneMap);
    await store.record(kNewUid).put(database, kTodoNewMap);

    final result = await localDS.list(TodoFilter.all()).first;
    expect(result.isRight(), true);
    expect(result.getOrElse(() => []).length, 2);
  });

  test('should list 1, using filter done', () async {
    await store.record(kUid).put(database, kTodoDoneMap);
    await store.record(kNewUid).put(database, kTodoNewMap);

    final result = await localDS.list(TodoFilter.done()).first;
    expect(result.isRight(), true);
    expect(result.getOrElse(() => []).length, 1);
  });

  test('should list 0, using filter todo', () async {
    await store.record(kUid).put(database, kTodoDoneMap);

    final result = await localDS.list(TodoFilter.available()).first;
    expect(result.isRight(), true);
    expect(result.getOrElse(() => []).length, 0);
  });

  test('should create', () async {
    when(() => uuid.v1()).thenReturn(kNewUid);

    final result = await localDS.save(kTodoNewMap);
    expect(result.isRight(), true);
  });

  test('should update', () async {
    await store.record(kUid).put(database, kTodoDoneMap);

    final result = await localDS.save(kTodoUnDoneMap);
    expect(result.isRight(), true);
  });

  test('should read successfully', () async {
    await store.record(kUid).put(database, kTodoDoneMap);

    final result = await localDS.read(kUid);
    expect(result.isRight(), true);
  });

  test('should read nothing', () async {
    final result = await localDS.read(kUid);
    expect(result.isLeft(), true);
  });
}
