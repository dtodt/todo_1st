import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-do 1st',
      theme: ThemeData(primarySwatch: Colors.blue),
    ).modular();
  }
}
