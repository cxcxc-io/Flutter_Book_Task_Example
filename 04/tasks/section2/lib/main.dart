import 'package:flutter/material.dart';
import 'package:section2/screens/state_change_demo_screen.dart';

class AppEntryPoint extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "question one demo",
      routes: {
        "/": (BuildContext context) => StateChangeDemoScreen()
      },
      initialRoute: "/",
    );
  }
}

void main() {
  runApp(AppEntryPoint());
}