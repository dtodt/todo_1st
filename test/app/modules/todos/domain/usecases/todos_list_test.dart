import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:todo1st/app/modules/todos/domain/repositories/index.dart';
import 'package:todo1st/app/modules/todos/domain/usecases/index.dart';

import '../../../../../constants/index.dart';
import '../../../../../mocks/index.dart';

void main() {
  late ITodosRepository repository;
  late TodosList usecase;

  setUpAll(() {
    repository = MockITodosRepository();
    usecase = TodosList(repository);
  });

  testWidgets('should list successfully', (_) async {
    when(repository.list('')).thenAnswer((_) => Stream.fromIterable([
          Right([fTask]),
        ]));

    usecase('').listen(expectAsync1((result) => expect(result, isNotEmpty)));
  });

  testWidgets('should list nothing', (_) async {
    when(repository.list('')).thenAnswer((_) => Stream.fromIterable([
          Left(MockFailure()),
        ]));

    usecase('').listen(expectAsync1((result) => expect(result, isEmpty)));
  });
}
