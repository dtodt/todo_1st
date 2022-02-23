import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_module.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: Modular.isModuleReady<AppModule>(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }

        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'To-do 1st',
          theme: ThemeData(),
          darkTheme: ThemeData.dark(),
          themeMode: ThemeMode.system,
        ).modular();
      },
    );
  }
}
