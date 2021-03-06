import 'package:flutter/material.dart';
import 'package:todo1st/app/app_constants.dart';
import 'package:todo1st/app/shared/presentation/index.dart';

/// Signature of this widget callbacks.
typedef StringCallback = void Function(String text);

///
class TodoAddInput extends StatefulWidget {
  const TodoAddInput({
    Key? key,
    required this.onAddTask,
  }) : super(key: key);

  final StringCallback? onAddTask;

  @override
  State<TodoAddInput> createState() => _TodoAddInputState();
}

class _TodoAddInputState extends State<TodoAddInput>
    with SingleTickerProviderStateMixin {
  final textController = TextEditingController();
  final textFocusNode = FocusNode();

  late final AnimationController _controller;

  bool canAdd = false;
  bool showAdd = false;

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
                child: TodoInput(
                  controller: textController,
                  enabled: _checkCanAdd(),
                  focusNode: textFocusNode,
                  onFieldSubmitted: (_) => _returnAndClear(),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: AnimatedButton(
                animationController: _controller,
                onPressed: onButtonClick,
              ),
              right: 4,
              top: 0,
            ),
            Positioned(
              bottom: 0,
              child: TodoAdd(
                enabled: _checkAddEnabled(),
                duration: _controller.duration!,
                onPressed: _returnAndClear,
                visible: showAdd,
              ),
              left: 4,
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
        canAdd = _checkAddEnabled();
      });
    });
  }

  bool _checkCanAdd() {
    return widget.onAddTask != null;
  }

  bool _checkAddEnabled() {
    return _checkCanAdd() && textController.text.isNotEmpty;
  }

  /// ? Not sure why yet, but calling focus directly disables typing, until the field is touched again
  Future<dynamic> _textInputFocus() =>
      Future.delayed(const Duration(milliseconds: 200))
          .then((_) => textFocusNode.requestFocus());

  void onButtonClick() {
    final willHide = AnimationStatus.completed == _controller.status;
    willHide ? _controller.reverse() : _controller.forward();

    setState(() {
      showAdd = !willHide;
    });

    if (willHide) {
      textController.clear();
    } else {
      _textInputFocus();
    }
  }

  void _returnAndClear() {
    if (_checkAddEnabled()) {
      widget.onAddTask!(textController.text);
    }

    textController.clear();

    _textInputFocus();
  }
}

/// Separated is easy to read
class TodoAdd extends StatelessWidget {
  final bool enabled;
  final Duration duration;
  final VoidCallback onPressed;
  final bool visible;

  const TodoAdd({
    Key? key,
    required this.enabled,
    required this.duration,
    required this.onPressed,
    required this.visible,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: visible ? 1 : 0,
      duration: duration,
      child: FloatingActionButton.extended(
        backgroundColor: enabled ? kPrimaryColor : Colors.grey,
        label: const Text('Add'),
        onPressed: enabled ? onPressed : null,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50.0),
            bottomLeft: Radius.circular(50.0),
            topRight: Radius.circular(30.0),
            bottomRight: Radius.circular(30.0),
          ),
        ),
      ),
    );
  }
}

/// Separated is easy to read
class TodoInput extends StatelessWidget {
  final bool enabled;
  final ValueChanged<String>? onFieldSubmitted;
  final TextEditingController controller;
  final FocusNode focusNode;

  const TodoInput({
    Key? key,
    required this.enabled,
    required this.onFieldSubmitted,
    required this.controller,
    required this.focusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: true,
      decoration: const InputDecoration(
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        contentPadding:
            EdgeInsets.only(left: 80, bottom: 15, top: 17, right: 64),
      ),
      controller: controller,
      enabled: enabled,
      focusNode: focusNode,
      onFieldSubmitted: onFieldSubmitted,
    );
  }
}
