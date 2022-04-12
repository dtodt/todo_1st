/// State of filtered todos
enum TodoState {
  ///
  all,

  ///
  available,

  ///
  done,
}

/// Domain implementation of todo filter
class TodoFilterEntity {
  final TodoState state;

  const TodoFilterEntity({
    required this.state,
  });
}
