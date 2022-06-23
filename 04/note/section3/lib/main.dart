import 'package:flutter/material.dart';
import 'package:section3/screens/colorful_demo_screen.dart';
import 'package:section3/screens/todo_input_demo_screen.dart';

class AppEntryPoint extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        "/color-demo": (BuildContext context) => ColorfulDemoScreen(),
        "/task": (BuildContext context) => TodoInputDemoScreen()
      },
      initialRoute: "/task",
    );
  }
}

void main() {
  runApp(AppEntryPoint());
}