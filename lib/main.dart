import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app/index.dart' deferred as app;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ModularApp(module: app.AppModule(), child: app.AppWidget()));
}
