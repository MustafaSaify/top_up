import 'package:flutter/material.dart';
import 'package:top_up/src/routing/routes.dart';
import 'package:top_up/src/routing/router.dart' as app_router;

void main() {
  runApp(const TopUpApp());
}

class TopUpApp extends StatelessWidget {
  const TopUpApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: home,
      onGenerateRoute: app_router.Router.generateRoute,
    );
  }
}
