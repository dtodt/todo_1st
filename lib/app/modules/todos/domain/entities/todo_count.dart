import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_count.freezed.dart';

/// Constract of todo count
abstract class TodoCount {
  int get available;
  int get done;
  int get total;
}

/// Domain implementation of todo count
@freezed
class TodoCountEntity with _$TodoCountEntity implements TodoCount {
  factory TodoCountEntity({
    @Default(0) int available,
    @Default(0) int done,
    @Default(0) int total,
  }) = _TodoCountEntity;
}
