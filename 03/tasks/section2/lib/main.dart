import 'package:flutter/material.dart';
import 'package:section2/screens/demo_screen.dart';

class AppEntryPoint extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DemoScreen(),
    );
  }
}

void main() {
  runApp(AppEntryPoint());
}
