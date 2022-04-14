import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo1st/app/modules/todos/domain/index.dart';

import '../../../../../constants.dart';
import '../../../../../mocks.dart';

void main() {
  late ITodosRepository repository;
  late TodosAdd usecase;

  setUpAll(() {
    repository = TodosRepositoryMock();
    usecase = TodosAdd(repository);
  });

  test('should not fail', () async {
    when(() => repository.save(kTodoDone))
        .thenAnswer((_) async => const Right(unit));

    final result = await usecase(kTodoDone);
    expect(result, isNotNull);
  });
}
