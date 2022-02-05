import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo1st/app/modules/todos/domain/entities/index.dart';
import 'package:todo1st/app/modules/todos/presentation/cubit/index.dart';

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
      body: BlocBuilder<TodosCubit, String>(
        bloc: store,
        builder: (_, filter) {
          return StreamBuilder<List<TaskEntity>>(
            stream: cubit.list(),
            builder: (_, AsyncSnapshot<List<TaskEntity>> snapshots) {
              if (!snapshots.hasData) {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              }

              return ListView.builder(
                itemBuilder: (_, index) {
                  final task = snapshots.data![index];
                  return CheckboxListTile(
                    key: Key(task.uid),
                    title: Text(task.description),
                    value: task.done,
                    onChanged: (checked) => {},
                  );
                },
                itemCount: snapshots.data!.length,
              );
            },
          );
        },
      ),
    );
  }
}
