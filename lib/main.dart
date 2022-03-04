import 'dart:async';

import 'package:flutter/material.dart' show runApp, WidgetsFlutterBinding;
import 'package:flutter_modular/flutter_modular.dart' deferred as modular
    show ModularApp;

import 'app/index.dart' deferred as app;
import 'firebase_setup.dart' deferred as fb;

Future<void> main() async {
  await fb.loadLibrary();
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    await fb.firebaseSetup();

    await modular.loadLibrary();
    await app.loadLibrary();
    runApp(modular.ModularApp(module: app.AppModule(), child: app.AppWidget()));
  }, fb.logOnFirebase);
}
