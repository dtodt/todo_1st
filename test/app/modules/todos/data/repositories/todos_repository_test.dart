import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:todo1st/app/core/errors/index.dart';
import 'package:todo1st/app/modules/todos/data/datasources/index.dart';
import 'package:todo1st/app/modules/todos/data/repositories/index.dart';
import 'package:todo1st/app/modules/todos/domain/repositories/index.dart';

import '../../../../../constants/index.dart';
import '../../../../../mocks/index.dart';

void main() {
  late ITodosLocalDS localDS;
  late ITodosRepository repository;

  setUpAll(() {
    localDS = MockITodosLocalDS();
    repository = TodosRepository(localDS);
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
}
