import 'package:flutter/material.dart';

class FakeApp extends StatelessWidget {
  const FakeApp({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(_) {
    return MaterialApp(home: child);
  }
}

class FakeScaffoldApp extends StatelessWidget {
  const FakeScaffoldApp({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return FakeApp(child: Scaffold(body: child));
  }
}

class FakeSliverApp extends StatelessWidget {
  const FakeSliverApp({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return FakeScaffoldApp(
      child: Scaffold(
        body: SizedBox(
          child: CustomScrollView(
            controller: ScrollController(),
            slivers: <Widget>[
              SliverPadding(
                sliver: child,
                padding: const EdgeInsets.all(0),
              ),
            ],
          ),
          height: 500,
        ),
      ),
    );
  }
}
