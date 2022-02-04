import 'package:bloc_test/bloc_test.dart';
import 'package:todo1st/app/modules/todos/presentation/cubit/todos_cubit.dart';

import '../../../../../mocks/index.dart';

void main() {
  blocTest<TodosCubit, String>(
    'emits [wow] when filter method is called with wow',
    build: () => TodosCubit(MockTodosList(), MockTodosSave()),
    act: (cubit) => cubit.filter('wow'),
    expect: () => ['wow'],
  );
}
