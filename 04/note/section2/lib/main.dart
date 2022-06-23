import 'package:flutter/material.dart';
import 'package:section2/screens/colorful_demo_screen.dart';

class AppEntryPoint extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "cxcxc statefulwidget demo",
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      routes: {
        "/color-demo": (BuildContext context) => ColorfulDemoScreen()
      },
      initialRoute: "/color-demo",
    );
  }
}

void main() {
  runApp(AppEntryPoint());
}