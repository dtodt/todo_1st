import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo1st/app/modules/todos/domain/entities/index.dart';

part 'todo_count.freezed.dart';
part 'todo_count.g.dart';

/// Data implementation of todo count
@freezed
class TodoCountModel with _$TodoCountModel implements TodoCount {
  factory TodoCountModel({
    @Default(0) int available,
    @Default(0) int done,
    @Default(0) int total,
  }) = _TodoCountModel;

  factory TodoCountModel.fromJson(Map<String, dynamic> json) =>
      _$TodoCountModelFromJson(json);
}
