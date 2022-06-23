import 'package:flutter/material.dart';
import 'package:section7/screens/first_screen.dart';
import 'package:section7/screens/second_screen.dart';
import 'package:section7/screens/third_screen.dart';

class AppEntryPoint extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/first": (BuildContext context) => FirstScreen(),
        "/second": (BuildContext context) => SecondScreen(),
        "/third": (BuildContext context) => ThirdScreen()
      },
      initialRoute: "/first",
    );
  }
}

void main() {
  runApp(AppEntryPoint());
}