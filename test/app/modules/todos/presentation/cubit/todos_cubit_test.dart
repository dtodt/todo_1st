import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo1st/app/modules/todos/data/index.dart';
import 'package:todo1st/app/modules/todos/presentation/index.dart';

import '../../../../../constants.dart';
import '../../../../../mocks.dart';

void main() {
  final mockTodosCount = TodosCountMock();
  final mockTodosList = TodosListMock();
  final mockTodosRead = TodosReadMock();
  final mockTodosSave = TodosSaveMock();
  final todosCubit = TodosCubit(
    mockTodosCount,
    mockTodosList,
    mockTodosRead,
    mockTodosSave,
  );

  blocTest<TodosCubit, TodosState>(
    'should call TodosSave when the add method is called',
    build: () {
      when(() => mockTodosSave.call(fNewTodo)).thenAnswer((_) async => unit);
      return todosCubit;
    },
    act: (cubit) => cubit.add(kDescription),
    verify: (_) => verify(() => mockTodosSave.call(fNewTodo)).called(1),
  );

  blocTest<TodosCubit, TodosState>(
    'should call TodosCount when the count method is called',
    build: () {
      when(() => mockTodosCount.call(TodoFilterModel.all()))
          .thenAnswer((_) async => fCountEntity);
      return todosCubit;
    },
    act: (cubit) => cubit.count(TodoFilterModel.all()),
    verify: (_) =>
        verify(() => mockTodosCount.call(TodoFilterModel.all())).called(1),
  );

  blocTest<TodosCubit, TodosState>(
    'should call TodosList when the list method is called',
    build: () {
      when(() => mockTodosList.call(TodoFilterModel.all()))
          .thenAnswer((_) => Stream.value([
                fTodo,
              ]));
      return todosCubit;
    },
    act: (cubit) => cubit.list(TodoFilterModel.all()),
    verify: (_) =>
        verify(() => mockTodosList.call(TodoFilterModel.all())).called(1),
  );

  /// TODO verify why this test doesnt wait, causing the error:
  /// Bad state: Cannot emit new states after calling close
  // blocTest<TodosCubit, TodosState>(
  //   'should call TodosRead and TodosSave when the taskDone method is called',
  //   build: () {
  //     when(() =>mockTodosRead.call(kUid))
  //         .thenAnswer((_) async => Right(fTaskEntity));
  //     when(() =>mockTodosSave.call(fTaskEntityUpdated))
  //         .thenAnswer((_) async => unit);
  //     return todosCubit;
  //   },
  //   act: (cubit) async {
  //     await cubit.taskDone(kUid, true);
  //     await untilCalled(mockTodosSave.call(fTaskEntityUpdated));
  //   },
  //   verify: (_) {
  //     verify(mockTodosRead.call(kUid)).called(1);
  //     verify(mockTodosSave.call(fTaskEntityUpdated)).called(1);
  //   },
  // );
}
