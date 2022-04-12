import 'package:todo1st/app/modules/todos/domain/index.dart';

///
class TodoEntityAdapter {
  static TodoEntity fromJson(Map<String, dynamic> json) {
    return TodoEntity(
      description: json['description'] as String,
      done: json['done'] as bool,
      uid: json['uid'] as String,
    );
  }

  static List<TodoEntity> fromList(List<dynamic> list) {
    return list.map((json) => fromJson(json)).toList();
  }

  static Map<String, dynamic> toJson(TodoEntity entity) {
    return {
      'description': entity.description,
      'done': entity.done,
      'uid': entity.uid,
    };
  }
}
