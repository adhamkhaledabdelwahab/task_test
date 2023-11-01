import 'package:flutter/material.dart';
import 'package:task_test/src/core/router/router_names.dart';
import 'package:task_test/src/presentation/dashboard/dashboard_screen.dart';

class CustomRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouterNames.rDashboard:
        return MaterialPageRoute(
          builder: (_) => const DashboardScreen(),
        );
      default:
        return null;
    }
  }
}
