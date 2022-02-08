import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:todo1st/app/modules/todos/presentation/cubit/index.dart';

import '../../../../../constants/index.dart';
import '../../../../../mocks/index.dart';

void main() {
  final mockTodosCount = MockTodosCount();
  final mockTodosList = MockTodosList();
  final mockTodosRead = MockTodosRead();
  final mockTodosSave = MockTodosSave();
  final todosCubit = TodosCubit(
    mockTodosCount,
    mockTodosList,
    mockTodosRead,
    mockTodosSave,
  );

  blocTest<TodosCubit, TodosState>(
    'should call TodosSave when the add method is called',
    build: () {
      when(mockTodosSave.call(fNewTaskEntity)).thenAnswer((_) async => unit);
      return todosCubit;
    },
    act: (cubit) => cubit.add(kDescription),
    verify: (_) => verify(mockTodosSave.call(fNewTaskEntity)).called(1),
  );

  blocTest<TodosCubit, TodosState>(
    'should call TodosCount when the count method is called',
    build: () {
      when(mockTodosCount.call('filter')).thenAnswer((_) => Stream.value(1));
      return todosCubit;
    },
    act: (cubit) => cubit.count('filter'),
    verify: (_) => verify(mockTodosCount.call('filter')).called(1),
  );

  blocTest<TodosCubit, TodosState>(
    'should call TodosList when the list method is called',
    build: () {
      when(mockTodosList.call('filter')).thenAnswer((_) => Stream.value(
            [fTask],
          ));
      return todosCubit;
    },
    act: (cubit) => cubit.list('filter'),
    verify: (_) => verify(mockTodosList.call('filter')).called(1),
  );

  /// TODO verify why this test doesnt wait, causing the error:
  /// Bad state: Cannot emit new states after calling close
  // blocTest<TodosCubit, TodosState>(
  //   'should call TodosRead and TodosSave when the taskDone method is called',
  //   build: () {
  //     when(mockTodosRead.call(kUid))
  //         .thenAnswer((_) async => Right(fTaskEntity));
  //     when(mockTodosSave.call(fTaskEntityUpdated))
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
