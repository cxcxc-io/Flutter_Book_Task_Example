import 'package:flutter/material.dart';
import 'screens/future_builder_demo_screen.dart';
import 'screens/post_screen.dart';

void main() {
  runApp(AppEntryPoint());
}

class AppEntryPoint extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/remote-data": (BuildContext context) => FutureBuilderDemoScreen(),
        "/post-screen": (BuildContext context) => PostScreen()
      },
      initialRoute: "/post-screen",
    );
  }
}