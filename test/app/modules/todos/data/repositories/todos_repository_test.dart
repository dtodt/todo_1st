import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:todo1st/app/core/errors/index.dart';
import 'package:todo1st/app/modules/todos/data/datasources/index.dart';
import 'package:todo1st/app/modules/todos/data/repositories/index.dart';
import 'package:todo1st/app/modules/todos/domain/repositories/index.dart';
import 'package:uuid/uuid.dart';

import '../../../../../constants/index.dart';
import '../../../../../mocks/index.dart';

void main() {
  late ITodosLocalDS localDS;
  late ITodosRepository repository;
  late Uuid uuid;

  setUpAll(() {
    uuid = MockUuid();
    localDS = MockITodosLocalDS();
    repository = TodosRepository(localDS, uuid: uuid);
  });

  test('should count 1', () async {
    when(localDS.count('')).thenAnswer((_) => Stream.value(
          const Right(1),
        ));

    repository
        .count('')
        .listen(expectAsync1((result) => expect(result.isRight(), true)));
  });

  test('should count nothing', () async {
    when(localDS.count('')).thenAnswer((_) => Stream.value(
          Left(Failure()),
        ));

    repository
        .count('')
        .listen(expectAsync1((result) => expect(result.isLeft(), true)));
  });

  test('should list successfully', () async {
    when(localDS.list('')).thenAnswer((_) => Stream.value(
          Right([fTask]),
        ));

    repository
        .list('')
        .listen(expectAsync1((result) => expect(result.isRight(), true)));
  });

  test('should list nothing', () async {
    when(localDS.list('')).thenAnswer((_) => Stream.value(
          Left(Failure()),
        ));

    repository
        .list('')
        .listen(expectAsync1((result) => expect(result.isLeft(), true)));
  });

  test('should create', () async {
    when(uuid.v1()).thenReturn(kNewUid);
    when(localDS.save(fTaskWId)).thenAnswer((_) async => const Right(unit));

    final result = await repository.save(fNewTask);
    expect(result.isRight(), true);
  });

  test('should update', () async {
    when(localDS.save(fTask)).thenAnswer((_) async => const Right(unit));

    final result = await repository.save(fTask);
    expect(result.isRight(), true);
  });

  test('should read successfully', () async {
    when(localDS.read(kUid)).thenAnswer((_) async => Right(fTask));

    final result = await repository.read(kUid);
    expect(result.isRight(), true);
  });

  test('should read nothing', () async {
    when(localDS.read(kUid)).thenAnswer((_) async => Left(Failure()));

    final result = await repository.read(kUid);
    expect(result.isLeft(), true);
  });
}
