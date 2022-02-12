import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:todo1st/app/core/errors/index.dart';
import 'package:todo1st/app/modules/todos/data/datasources/index.dart';
import 'package:todo1st/app/modules/todos/data/models/index.dart';
import 'package:todo1st/app/modules/todos/data/repositories/index.dart';
import 'package:todo1st/app/modules/todos/domain/entities/index.dart';
import 'package:todo1st/app/modules/todos/domain/repositories/index.dart';
import 'package:todo1st/app/shared/data/datasources/index.dart';
import 'package:uuid/uuid.dart';

import '../../../../../constants/index.dart';
import '../../../../../mocks/index.dart';

void main() {
  late IKeyDS keyDS;
  late ITodosLocalDS localDS;
  late ITodosRepository repository;
  late Uuid uuid;

  setUpAll(() {
    uuid = MockUuid();
    keyDS = KeyUuidDS(uuid);
    localDS = MockITodosLocalDS();
    repository = TodosRepository(localDS, keyDS);
  });

  test('should count 1', () async {
    when(localDS.count(fFilterBoth))
        .thenAnswer((_) async => Right(TodoCountModel()));

    final result = await repository.count(fFilterBoth);
    expect(result.isRight(), true);
  });

  test('should count nothing', () async {
    when(localDS.count(fFilterBoth)).thenAnswer((_) async => Left(Failure()));

    final result = await repository.count(fFilterBoth);
    expect(result.isLeft(), true);
  });

  test('should list successfully', () async {
    when(localDS.list(fFilterBoth)).thenAnswer((_) => Stream.value(
          Right([fTodo]),
        ));

    repository
        .list(TodoFilterEntity())
        .listen(expectAsync1((result) => expect(result.isRight(), true)));
  });

  test('should list nothing', () async {
    when(localDS.list(fFilterBoth)).thenAnswer((_) => Stream.value(
          Left(Failure()),
        ));

    repository
        .list(TodoFilterEntity())
        .listen(expectAsync1((result) => expect(result.isLeft(), true)));
  });

  test('should create', () async {
    when(uuid.v1()).thenReturn(kNewUid);
    when(localDS.save(fNewTodoUpdated))
        .thenAnswer((_) async => const Right(unit));

    final result = await repository.save(fNewTodo);
    expect(result.isRight(), true);
  });

  test('should update', () async {
    when(localDS.save(fTodo)).thenAnswer((_) async => const Right(unit));

    final result = await repository.save(fTodo);
    expect(result.isRight(), true);
  });

  test('should read successfully', () async {
    when(localDS.read(kUid)).thenAnswer((_) async => Right(fTodo));

    final result = await repository.read(kUid);
    expect(result.isRight(), true);
  });

  test('should read nothing', () async {
    when(localDS.read(kUid)).thenAnswer((_) async => Left(Failure()));

    final result = await repository.read(kUid);
    expect(result.isLeft(), true);
  });
}
