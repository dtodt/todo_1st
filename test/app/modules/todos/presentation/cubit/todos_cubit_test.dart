import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo1st/app/modules/todos/presentation/cubit/index.dart';

import '../../../../../mocks/index.dart';

void main() {
  blocTest<TodosCubit, TodosState>(
    'emits [wow] when filter method is called with wow',
    build: () => TodosCubit(MockTodosList(), MockTodosSave()),
    act: (cubit) => cubit.filter('wow'),
    verify: (cubit) => [expect(cubit.state.filter, 'wow')],
  );
}
