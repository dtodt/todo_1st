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
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocBuilder<TodosCubit, TodosState>(
        bloc: store,
        builder: (_, __) {
          return Column(
            children: [
              TaskAddInput(
                onAddTask: cubit.add,
              ),
              Expanded(
                child: Container(
                  child: TaskList(
                    items: cubit.list(),
                    onItemChecked: cubit.taskDone,
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                ),
              ),
            ],
            crossAxisAlignment: CrossAxisAlignment.stretch,
          );
        },
      ),
    );
  }
}
