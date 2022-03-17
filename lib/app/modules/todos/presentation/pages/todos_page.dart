import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo1st/app/app_constants.dart';
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
              backgroundColor: kPrimaryColor,
              foregroundColor: Colors.white,
              expandedHeight: 170,
              flexibleSpace: FlexibleSpaceBar(
                background: DecoratedBox(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 30.0),
                    child: SvgPicture.asset(
                      'images/todo_logo_alpha.svg',
                      semanticsLabel: 'To-do 1st Logo',
                    ),
                  ),
                  position: DecorationPosition.background,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: <Color>[
                        kPrimaryColor,
                        Colors.lightBlue,
                      ],
                    ),
                  ),
                ),
                title: FutureBuilder<TodoCount>(
                  future: cubit.count(TodoFilterEntity()),
                  builder: (_, snapshot) {
                    if (!snapshot.hasData || snapshot.data!.total == 0) {
                      return Text(
                        widget.title,
                        style: kWhiteText,
                      );
                    }
                    final count = snapshot.data;
                    return Text(
                      '${widget.title} [${count!.done}~${count.total}]',
                      style: kWhiteText,
                    );
                  },
                ),
                stretchModes: const <StretchMode>[
                  StretchMode.zoomBackground,
                  StretchMode.fadeTitle,
                  StretchMode.blurBackground,
                ],
              ),
              pinned: true,
              stretch: true,
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
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: (() {}),
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
