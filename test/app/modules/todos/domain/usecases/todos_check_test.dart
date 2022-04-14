import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo1st/app/core/index.dart';
import 'package:todo1st/app/modules/todos/domain/index.dart';

import '../../../../../constants.dart';
import '../../../../../mocks.dart';

void main() {
  late ITodosRepository repository;
  late ITodosCheck usecase;

  setUpAll(() {
    registerFallbackValue(kTodoDone);

    repository = TodosRepositoryMock();
    usecase = TodosCheck(repository);
  });

  test('should check successfully', () async {
    when(() => repository.read(any()))
        .thenAnswer((_) async => const Right(kTodoUnDone));
    when(() => repository.save(any()))
        .thenAnswer((_) async => const Right(unit));

    final result = await usecase(kTodoCheck);
    expect(result.isRight(), true);
  });

  test('should read nothing', () async {
    when(() => repository.read(any()))
        .thenAnswer((_) async => const Left(Failure()));

    final result = await usecase(kTodoCheck);
    expect(result.isLeft(), true);
  });
}
