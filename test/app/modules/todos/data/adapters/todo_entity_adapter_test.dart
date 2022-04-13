import 'package:flutter_test/flutter_test.dart';
import 'package:todo1st/app/modules/todos/data/adapters/todo_entity_adapter.dart';
import 'package:todo1st/app/modules/todos/domain/index.dart';

import '../../../../../constants.dart';

void main() {
  test('should convert a json into a todo', () async {
    final result = TodoEntityAdapter.fromJson(kTodoMap);
    expect(result, isA<TodoEntity>());
  });

  test('should convert a list of json into a list of todo', () async {
    final result = TodoEntityAdapter.fromList([kTodoMap]);
    expect(result, isA<List<TodoEntity>>());
    expect(result, isNotEmpty);
  });

  test('should convert a todo into json', () async {
    final result = TodoEntityAdapter.toJson(fTodo);
    expect(result, isA<Map>());
  });
}
