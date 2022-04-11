import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo1st/app/modules/todos/presentation/cubit/index.dart';
import 'package:todo1st/app/modules/todos/presentation/widgets/index.dart';

class TodosPage extends StatefulWidget {
  final String title;

  const TodosPage({Key? key, this.title = 'To-do\'s'}) : super(key: key);

  @override
  TodosPageState createState() => TodosPageState();
}

class TodosPageState extends ModularState<TodosPage, TodosCubit> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodosCubit, TodosState>(
      bloc: store,
      builder: (context, state) => Scaffold(
        body: Stack(
          children: <Widget>[
            Positioned.fill(
              child: CustomScrollView(
                slivers: <Widget>[
                  TodoAppBar(widget.title),
                  TodoList(
                    items: cubit.list(state.filter),
                    onItemChecked: cubit.taskDone,
                  )
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              child: TodoAddInput(
                onAddTask: cubit.add,
              ),
              left: 0,
              right: 0,
            ),
          ],
        ),
      ),
    );
  }
}
