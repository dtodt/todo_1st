import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_constants.dart';
import 'app_module.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: Modular.isModuleReady<AppModule>(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            child: const Center(
              child: CircularProgressIndicator.adaptive(),
            ),
            color: const Color(kPrimaryColorValue),
            height: double.infinity,
            width: double.infinity,
          );
        }

        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'To-do 1st',
          theme: ThemeData(
            brightness: Brightness.light,
            floatingActionButtonTheme: kFloatingActionButtonTheme,
            primarySwatch: kPrimaryColor,
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            floatingActionButtonTheme: kFloatingActionButtonTheme,
            primarySwatch: kPrimaryColor,
          ),
          routerDelegate: Modular.routerDelegate,
          routeInformationParser: Modular.routeInformationParser,
        );
      },
    );
  }
}
