import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:todo1st/app/core/errors/index.dart';
import 'package:todo1st/app/modules/todos/domain/repositories/index.dart';
import 'package:todo1st/app/modules/todos/domain/usecases/index.dart';

import '../../../../../constants/index.dart';
import '../../../../../mocks/index.dart';

void main() {
  late ITodosRepository repository;
  late TodosRead usecase;

  setUpAll(() {
    repository = MockITodosRepository();
    usecase = TodosRead(repository);
  });

  test('should read successfully', () async {
    when(repository.read(kUid)).thenAnswer((_) async => Right(fTodo));

    final result = await usecase(kUid);
    expect(result.isRight(), true);
  });

  test('should read nothing', () async {
    when(repository.read(kUid)).thenAnswer((_) async => Left(Failure()));

    final result = await usecase(kUid);
    expect(result.isLeft(), true);
  });
}
