import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo1st/app/modules/todos/domain/entities/index.dart';

part 'task_model.freezed.dart';
part 'task_model.g.dart';

///
@freezed
class TaskModel with _$TaskModel implements TaskEntity {
  factory TaskModel({
    required String description,
    @Default(false) bool done,
    @Default('') String uid,
  }) = _TaskModel;

  factory TaskModel.fromJson(Map<String, dynamic> json) =>
      _$TaskModelFromJson(json);

  factory TaskModel.empty() => TaskModel(description: '');
}
