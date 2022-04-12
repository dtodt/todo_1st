import 'package:todo1st/app/modules/todos/domain/index.dart';

///
class TodoCountAdapter {
  static TodoCountEntity fromJson(Map<String, dynamic> json) {
    return TodoCountEntity(
      all: json['all'],
      available: json['available'],
      done: json['done'],
    );
  }

  static Map<String, dynamic> toJson(TodoCountEntity entity) {
    return {
      'all': entity.all,
      'available': entity.available,
      'done': entity.done,
    };
  }
}
