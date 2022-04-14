/// Status of filtered todos
enum TodoStatus {
  ///
  all,

  ///
  available,

  ///
  done,
}

/// Domain implementation of todo filter
class TodoFilter {
  const TodoFilter({
    required this.status,
  });

  final TodoStatus status;

  factory TodoFilter.all() => const TodoFilter(status: TodoStatus.all);
  factory TodoFilter.available() =>
      const TodoFilter(status: TodoStatus.available);
  factory TodoFilter.done() => const TodoFilter(status: TodoStatus.done);
}
