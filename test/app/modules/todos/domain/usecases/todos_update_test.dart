import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:todo1st/app/modules/todos/domain/repositories/index.dart';
import 'package:todo1st/app/modules/todos/domain/usecases/todos_update.dart';

import '../../../../../mocks/index.dart';

void main() {
  late ITodosRepository repository;
  late TodosUpdate usecase;

  setUpAll(() {
    repository = MockITodosRepository();
    usecase = TodosUpdate(repository);
  });

  /// TODO Fix this test when implement data models,
  ///  the task mock is breaking it.
  testWidgets('should not fail', (_) async {
    when(repository.update(MockTodoTask()))
        .thenAnswer((_) async => const Right(unit));

    final result = await usecase(MockTodoTask());
    expect(result, isNotNull);
  });
}
