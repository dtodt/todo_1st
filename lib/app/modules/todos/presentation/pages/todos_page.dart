import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo1st/app/modules/todos/domain/index.dart';
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
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: Theme.of(context).colorScheme.primary,
              foregroundColor: Theme.of(context).colorScheme.onPrimary,
              expandedHeight: 170,
              flexibleSpace: FlexibleSpaceBar(
                background: Padding(
                  padding: const EdgeInsets.only(bottom: 30.0),
                  child: SvgPicture.asset(
                    'images/todo_logo.svg',
                    semanticsLabel: 'To-do 1st Logo',
                  ),
                ),
                title: FutureBuilder<TodoCount>(
                  future: cubit.count(TodoFilterEntity()),
                  builder: (_, snapshot) {
                    if (!snapshot.hasData || snapshot.data!.total == 0) {
                      return Text(
                        widget.title,
                      );
                    }
                    final count = snapshot.data;
                    return Text(
                      '${widget.title} [${count!.done}~${count.total}]',
                    );
                  },
                ),
              ),
              pinned: true,
              // snap: true,
            ),
            SliverToBoxAdapter(
              child: TaskAddInput(
                onAddTask: cubit.add,
              ),
            ),
            TodoList(
              items: cubit.list(state.filter),
              onItemChecked: cubit.taskDone,
            )
          ],
          // crossAxisAlignment: CrossAxisAlignment.stretch,
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
