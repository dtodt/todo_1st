import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo1st/app/modules/todos/domain/entities/index.dart';

part 'todo.freezed.dart';
part 'todo.g.dart';

@freezed
class TodoModel with _$TodoModel implements Todo {
  factory TodoModel({
    required String description,
    required bool done,
    required String uid,
  }) = _TodoModel;

  factory TodoModel.fromJson(Map<String, dynamic> json) =>
      _$TodoModelFromJson(json);

  factory TodoModel.fromEntity(Todo entity) => TodoModel(
      description: entity.description, done: entity.done, uid: entity.uid);
}
