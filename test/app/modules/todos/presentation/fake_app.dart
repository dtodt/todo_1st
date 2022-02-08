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
    return MaterialApp(home: Scaffold(body: child));
  }
}
