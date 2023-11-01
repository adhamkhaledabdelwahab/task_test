import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:task_test/src/core/consts/bloc_observer.dart';
import 'package:task_test/src/core/consts/color_palette.dart';
import 'package:task_test/src/core/consts/const_methods.dart';
import 'package:task_test/src/core/router/router.dart';
import 'package:task_test/src/core/services/dio_service.dart';

void main() {
  runZonedGuarded(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      Bloc.observer = MyBlocObserver();
      DioService.init();
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
