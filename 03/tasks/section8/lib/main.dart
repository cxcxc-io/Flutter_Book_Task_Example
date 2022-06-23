import 'package:flutter/material.dart';
import 'package:section8/screens/first_screen.dart';
import 'package:section8/screens/second_screen.dart';

class AppEntryPoint extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/first": (BuildContext context) => FirstScreen(),
        "/second": (BuildContext context) => SecondScreen()
      },
      initialRoute: "/first",
    );
  }
}

void main() {
  runApp(AppEntryPoint());
}