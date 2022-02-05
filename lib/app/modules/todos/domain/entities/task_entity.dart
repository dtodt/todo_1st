import 'package:equatable/equatable.dart';

///
abstract class TaskEntity {
  String get description;
  bool get done;
  String get uid;

  factory TaskEntity({
    required String description,
    bool done = false,
    String uid = '',
  }) =>
      _TaskEntity(
        description,
        done,
        uid,
      );
}

///
class _TaskEntity extends Equatable implements TaskEntity {
  @override
  final String uid;
  @override
  final String description;
  @override
  final bool done;

  const _TaskEntity(this.description, this.done, this.uid);

  @override
  List<Object?> get props => [uid, description, done];
}
