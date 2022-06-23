import 'package:flutter/material.dart';
import 'package:section3/screens/calculator.dart';

class AppEntryPoint extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/calculator": (BuildContext context) => Calculator()
      },
      initialRoute: "/calculator",
    );
  }
}

void main() {
  runApp(AppEntryPoint());
}