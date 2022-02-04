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

  testWidgets('should list successfully', (_) async {
    when(localDS.list('')).thenAnswer((_) => Stream.fromIterable([
          Right([fTask]),
        ]));

    repository
        .list('')
        .listen(expectAsync1((result) => expect(result.isRight(), true)));
  });

  testWidgets('should list nothing', (_) async {
    when(localDS.list('')).thenAnswer((_) => Stream.fromIterable([
          Left(Failure()),
        ]));

    repository
        .list('')
        .listen(expectAsync1((result) => expect(result.isLeft(), true)));
  });

  testWidgets('should create', (_) async {
    when(uuid.v1()).thenReturn(kUid);
    when(localDS.save(fTaskWId)).thenAnswer((_) async => const Right(unit));

    final result = await repository.save(fNewTask);
    expect(result.isRight(), true);
  });

  testWidgets('should update', (_) async {
    when(localDS.save(fTask)).thenAnswer((_) async => const Right(unit));

    final result = await repository.save(fTask);
    expect(result.isRight(), true);
  });
}
