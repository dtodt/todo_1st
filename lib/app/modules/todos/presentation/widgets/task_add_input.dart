import 'package:flutter/material.dart';
import 'package:todo1st/app/modules/todos/presentation/widgets/index.dart';

/// Signature of this widget callbacks.
typedef StringCallback = void Function(String text);

///
class TaskAddInput extends StatefulWidget {
  const TaskAddInput({
    Key? key,
    required this.onAddTask,
  }) : super(key: key);

  final StringCallback? onAddTask;

  @override
  State<TaskAddInput> createState() => _TaskAddInputState();
}

class _TaskAddInputState extends State<TaskAddInput>
    with SingleTickerProviderStateMixin {
  final textController = TextEditingController();
  final textFocusNode = FocusNode();

  late final AnimationController _controller;

  bool canAdd = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Stack(
          alignment: AlignmentDirectional.topEnd,
          children: <Widget>[
            Positioned.fill(
              child: AnimatedTray(
                animationController: _controller,
                child: TextFormField(
                  autofocus: true,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    contentPadding: EdgeInsets.only(
                        left: 20, bottom: 16, top: 16, right: 64),
                  ),
                  controller: textController,
                  enabled: checkCanAdd(),
                  focusNode: textFocusNode,
                  onFieldSubmitted: (_) => returnAndClear(),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: AnimatedButton(
                animationController: _controller,
                onPressed: () => AnimationStatus.completed == _controller.status
                    ? _controller.reverse()
                    : _controller.forward(),
              ),
              right: 4,
              top: 0,
            )
          ],
        ),
      ),
      height: 90.0,
      width: double.infinity,
    );
  }

  @override
  void dispose() {
    textController.dispose();
    textFocusNode.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this);

    textController.addListener(() {
      setState(() {
        canAdd = checkAddEnabled();
      });
    });
  }

  bool checkCanAdd() {
    return widget.onAddTask != null;
  }

  bool checkAddEnabled() {
    return checkCanAdd() && textController.text.isNotEmpty;
  }

  void returnAndClear() {
    if (checkAddEnabled()) {
      widget.onAddTask!(textController.text);
    }

    textController.clear();

    /// ? Not sure why yet, but calling focus directly disables typing
    ///   until the field is touched again
    Future.delayed(const Duration(milliseconds: 200))
        .then((_) => textFocusNode.requestFocus());
  }
}
