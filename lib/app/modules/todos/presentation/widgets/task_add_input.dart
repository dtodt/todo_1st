import 'package:flutter/material.dart';

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

class _TaskAddInputState extends State<TaskAddInput> {
  final textController = TextEditingController();
  final textFocusNode = FocusNode();

  bool canAdd = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 0, 5.0, 0),
              child: TextFormField(
                autofocus: true,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Something to be done',
                ),
                controller: textController,
                enabled: checkCanAdd(),
                focusNode: textFocusNode,
                onFieldSubmitted: (_) => returnAndClear(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 0, 15.0, 0),
            child: IconButton(
              icon: const Icon(Icons.add),
              onPressed: canAdd ? returnAndClear : null,
            ),
          )
        ],
      ),
      height: 70.0,
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
