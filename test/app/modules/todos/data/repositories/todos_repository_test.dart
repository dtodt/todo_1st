import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo1st/app/core/errors/index.dart';
import 'package:todo1st/app/modules/todos/data/index.dart';
import 'package:todo1st/app/modules/todos/domain/index.dart';

import '../../../../../constants.dart';
import '../../../../../mocks.dart';

void main() {
  late ITodosLocalDS localDS;
  late ITodosRepository repository;

  setUpAll(() {
    localDS = TodosLocalDSMock();
    repository = TodosRepository(localDS);
  });

  test('should count 1', () async {
    when(() => localDS.count(fFilterAll))
        .thenAnswer((_) async => const Right(kCountMap));

    final result = await repository.count(fFilterAll);
    expect(result.isRight(), true);
  });

  test('should count nothing', () async {
    when(() => localDS.count(fFilterAll))
        .thenAnswer((_) async => const Left(Failure()));

    final result = await repository.count(fFilterAll);
    expect(result.isLeft(), true);
  });

  test('should list successfully', () async {
    when(() => localDS.list(TodoFilterModel.all()))
        .thenAnswer((_) => Stream.value(
              const Right([kTodoMap]),
            ));

    repository
        .list(TodoFilterModel.all())
        .listen(expectAsync1((result) => expect(result.isRight(), true)));
  });

  test('should list nothing', () async {
    when(() => localDS.list(TodoFilterModel.all()))
        .thenAnswer((_) => Stream.value(
              const Left(Failure()),
            ));

    repository
        .list(TodoFilterModel.all())
        .listen(expectAsync1((result) => expect(result.isLeft(), true)));
  });

  test('should create', () async {
    when(() => localDS.save(kNewTodoMap))
        .thenAnswer((_) async => const Right(unit));

    final result = await repository.save(fNewTodo);
    expect(result.isRight(), true);
  });

  test('should update', () async {
    when(() => localDS.save(kTodoMap))
        .thenAnswer((_) async => const Right(unit));

    final result = await repository.save(fTodo);
    expect(result.isRight(), true);
  });

  test('should read successfully', () async {
    when(() => localDS.read(kUid))
        .thenAnswer((_) async => const Right(kTodoMap));

    final result = await repository.read(kUid);
    expect(result.isRight(), true);
  });

  test('should read nothing', () async {
    when(() => localDS.read(kUid))
        .thenAnswer((_) async => const Left(Failure()));

    final result = await repository.read(kUid);
    expect(result.isLeft(), true);
  });
}
