import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo1st/app/modules/todos/domain/entities/index.dart';
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
      builder: (_, state) => Scaffold(
        appBar: AppBar(
          title: FutureBuilder<TodoCount>(
              future: cubit.count(TodoFilterEntity()),
              builder: (_, snapshot) {
                if (!snapshot.hasData || snapshot.data!.total == 0) {
                  return Text(widget.title);
                }

                final count = snapshot.data;
                return Text(
                  '${widget.title} [${count!.done}~${count.total}]',
                );
              }), // [$done ~ $total]
        ),
        body: Column(
          children: [
            TaskAddInput(
              onAddTask: cubit.add,
            ),
            Expanded(
              child: Container(
                child: TodoList(
                  items: cubit.list(state.filter),
                  onItemChecked: cubit.taskDone,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
              ),
            ),
          ],
          crossAxisAlignment: CrossAxisAlignment.stretch,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
