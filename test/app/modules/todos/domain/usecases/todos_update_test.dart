import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:todo1st/app/modules/todos/domain/repositories/index.dart';
import 'package:todo1st/app/modules/todos/domain/usecases/todos_update.dart';

import '../../../../../constants/index.dart';
import '../../../../../mocks/index.dart';

void main() {
  late ITodosRepository repository;
  late TodosUpdate usecase;

  setUpAll(() {
    repository = MockITodosRepository();
    usecase = TodosUpdate(repository);
  });

  testWidgets('should not fail', (_) async {
    when(repository.update(fTask)).thenAnswer((_) async => const Right(unit));

    final result = await usecase(fTask);
    expect(result, isNotNull);
  });
}
