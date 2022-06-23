import 'package:flutter/material.dart';
import 'screens/future_builder_demo_screen.dart';

void main() {
  runApp(AppEntryPoint());
}

class AppEntryPoint extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/remote-data": (BuildContext context) => FutureBuilderDemoScreen()
      },
      initialRoute: "/remote-data",
    );
  }
}
