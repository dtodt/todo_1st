import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_count.freezed.dart';

/// Constract of todo count
abstract class TodoCount {
  int get all;
  int get available;
  int get done;
}

/// Domain implementation of todo count
@freezed
class TodoCountEntity with _$TodoCountEntity implements TodoCount {
  factory TodoCountEntity({
    @Default(0) int all,
    @Default(0) int available,
    @Default(0) int done,
  }) = _TodoCountEntity;
}
