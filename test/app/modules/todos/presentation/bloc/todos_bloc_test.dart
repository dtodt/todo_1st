import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo1st/app/modules/todos/domain/index.dart';
import 'package:todo1st/app/modules/todos/presentation/index.dart';

import '../../../../../constants.dart';
import '../../../../../mocks.dart';

void main() {
  final todosAddMock = TodosAddMock();
  final todosCheckMock = TodosCheckMock();
  final todosFetchMock = TodosFetchMock();

  blocTest<TodosBloc, TodosState>(
    'should call TodosAdd when the add event is added',
    build: () {
      when(() => todosAddMock.call(kTodoNew)).thenAnswer((_) async => unit);
      return TodosBloc(todosAddMock, todosCheckMock, todosFetchMock);
    },
    act: (bloc) => bloc.add(const TodosAddEvent(kTodoNew)),
    verify: (_) => verify(() => todosAddMock.call(kTodoNew)).called(1),
  );

  blocTest<TodosBloc, TodosState>(
    'should call TodosCheck when the check event is added',
    build: () {
      when(() => todosCheckMock.call(kTodoCheck))
          .thenAnswer((_) async => const Right(unit));
      return TodosBloc(todosAddMock, todosCheckMock, todosFetchMock);
    },
    act: (bloc) => bloc.add(const TodosCheckEvent(kTodoCheck)),
    verify: (_) => verify(() => todosCheckMock.call(kTodoCheck)).called(1),
  );

  blocTest<TodosBloc, TodosState>(
    'should call TodosFetch when the fetch event is added',
    build: () {
      when(() => todosFetchMock.call(TodoFilter.all()))
          .thenAnswer((_) => Stream.value([
                kTodoDone,
              ]));
      return TodosBloc(todosAddMock, todosCheckMock, todosFetchMock);
    },
    act: (bloc) => bloc.add(TodosFetchEvent(TodoFilter.all())),
    expect: () => [
      isA<TodosLoading>(),
      isA<TodosLoaded>(),
    ],
  );
}
