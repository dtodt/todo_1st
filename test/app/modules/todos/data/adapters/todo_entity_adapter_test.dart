import 'package:flutter_test/flutter_test.dart';
import 'package:todo1st/app/modules/todos/data/index.dart';
import 'package:todo1st/app/modules/todos/domain/index.dart';

import '../../../../../constants.dart';

void main() {
  test('should convert a json into a todo', () async {
    final result = TodoEntityAdapter.fromJson(kTodoDoneMap);
    expect(result, isA<TodoEntity>());
  });

  test('should convert a list of json into a list of todo', () async {
    final result = TodoEntityAdapter.fromList([kTodoDoneMap]);
    expect(result, isA<List<TodoEntity>>());
    expect(result, isNotEmpty);
  });

  test('should convert a todo into json', () async {
    final result = TodoEntityAdapter.toJson(kTodoDone);
    expect(result, isA<Map>());
  });
}
