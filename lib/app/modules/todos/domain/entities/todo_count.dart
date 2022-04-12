/// Domain implementation of todo count
class TodoCountEntity {
  final int all;
  final int available;
  final int done;

  const TodoCountEntity({
    required this.all,
    required this.available,
    required this.done,
  });
}
