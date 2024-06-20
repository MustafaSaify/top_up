import 'package:flutter/material.dart';
import 'package:top_up/src/features/home/presentation/widgets/home_screen.dart';
import 'package:top_up/src/routing/routes.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
            child: Text('No route defined for ${settings.name}')),
          )
        );
    }
  }
}