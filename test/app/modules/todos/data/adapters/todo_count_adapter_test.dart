import 'package:flutter_test/flutter_test.dart';
import 'package:todo1st/app/modules/todos/data/adapters/todo_count_adapter.dart';
import 'package:todo1st/app/modules/todos/domain/index.dart';

import '../../../../../constants.dart';

void main() {
  test('should convert a json into a todo count', () async {
    final result = TodoCountAdapter.fromJson(kCountMap);
    expect(result, isA<TodoCountEntity>());
  });

  test('should convert a todo count into json', () async {
    final result = TodoCountAdapter.toJson(fCountEntity);
    expect(result, isA<Map>());
  });
}
