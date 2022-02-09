import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo1st/app/modules/todos/domain/entities/index.dart';

part 'todo_filter.freezed.dart';
part 'todo_filter.g.dart';

@freezed
class TodoFilterModel with _$TodoFilterModel implements TodoFilter {
  factory TodoFilterModel({
    required TodoState state,
  }) = _TodoFilterModel;

  factory TodoFilterModel.fromJson(Map<String, dynamic> json) =>
      _$TodoFilterModelFromJson(json);

  factory TodoFilterModel.fromEntity(TodoFilter entity) =>
      TodoFilterModel(state: entity.state);
}
