import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo1st/app/core/index.dart';
import 'package:todo1st/app/modules/todos/data/index.dart';
import 'package:todo1st/app/modules/todos/domain/index.dart';
import 'package:todo1st/app/modules/todos/presentation/index.dart';

class TodosPage extends StatefulWidget {
  final String title;

  const TodosPage({Key? key, this.title = 'To-do\'s'}) : super(key: key);

  @override
  TodosPageState createState() => TodosPageState();
}

class TodosPageState extends State<TodosPage> with CompleteStateMixin {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodosBloc, TodosState>(
      bloc: Modular.get<TodosBloc>(),
      builder: (context, state) => Scaffold(
        body: Stack(
          children: <Widget>[
            Positioned.fill(
              child: CustomScrollView(
                slivers: <Widget>[
                  TodoAppBar(widget.title),
                  if (state is! TodosLoaded || state.todos.isEmpty)
                    DataFallback(loading: state is! TodosLoaded),
                  if (state is TodosLoaded)
                    TodoList(
                      items: state.todos,
                      onItemChecked: _checkTodo,
                    )
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              child: TodoAddInput(
                onAddTask: _addTodo,
              ),
              left: 0,
              right: 0,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void completeState() {
    Modular.get<TodosBloc>().add(TodosFetchEvent(TodoFilter.all()));
  }

  void _addTodo(String text) {
    final todo = TodoModel.empty().copyWith(description: text);
    Modular.get<TodosBloc>().add(TodosAddEvent(todo));
  }

  void _checkTodo(String uid, bool checked) {
    Modular.get<TodosBloc>()
        .add(TodosCheckEvent(TodoCheck(uid: uid, checked: checked)));
  }
}
