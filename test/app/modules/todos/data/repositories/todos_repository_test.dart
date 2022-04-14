import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo1st/app/core/index.dart';
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

  test('should list successfully', () async {
    when(() => localDS.list(TodoFilter.all())).thenAnswer((_) => Stream.value(
          const Right([kTodoDoneMap]),
        ));

    repository
        .list(TodoFilter.all())
        .listen(expectAsync1((result) => expect(result.isRight(), true)));
  });

  test('should list nothing', () async {
    when(() => localDS.list(TodoFilter.all())).thenAnswer((_) => Stream.value(
          const Left(Failure()),
        ));

    repository
        .list(TodoFilter.all())
        .listen(expectAsync1((result) => expect(result.isLeft(), true)));
  });

  test('should create', () async {
    when(() => localDS.save(kTodoNewMap))
        .thenAnswer((_) async => const Right(unit));

    final result = await repository.save(kTodoNew);
    expect(result.isRight(), true);
  });

  test('should update', () async {
    when(() => localDS.save(kTodoDoneMap))
        .thenAnswer((_) async => const Right(unit));

    final result = await repository.save(kTodoDone);
    expect(result.isRight(), true);
  });

  test('should read successfully', () async {
    when(() => localDS.read(kUid))
        .thenAnswer((_) async => const Right(kTodoDoneMap));

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
