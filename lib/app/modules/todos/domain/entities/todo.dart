import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo.freezed.dart';

/// Contract of todo
abstract class Todo {
  String get description;
  bool get done;
  String get uid;
}

/// Domain implementation of todo entity
@freezed
class TodoEntity with _$TodoEntity implements Todo {
  factory TodoEntity({
    required String description,
    @Default(false) bool done,
    @Default('') String uid,
  }) = _TodoEntity;
}
