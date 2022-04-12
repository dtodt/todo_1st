/// Domain implementation of todo entity
class TodoEntity {
  final String description;
  final bool done;
  final String uid;

  const TodoEntity({
    required this.description,
    required this.done,
    required this.uid,
  });
}
