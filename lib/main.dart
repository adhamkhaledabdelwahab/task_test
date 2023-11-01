import 'dart:async';

import 'package:flutter/material.dart';
import 'package:task_test/src/core/consts/color_palette.dart';
import 'package:task_test/src/core/consts/const_methods.dart';
import 'package:task_test/src/core/router/router.dart';

void main() {
  runZonedGuarded(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      runApp(const MyApp());
    },
    (error, stack) {
      logError("Global Error: $error");
      logError("Global StackTrace: $stack");
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Task Test',
      theme: ThemeData(
        primarySwatch: Colors.red,
        primaryColor: ColorPalette.primaryColor,
      ),
      onGenerateRoute: CustomRouter.onGenerateRoute,
    );
  }
}
