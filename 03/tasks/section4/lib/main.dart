import 'package:flutter/material.dart';
import 'package:section4/screens/home_screen.dart';

class AppEntryPoint extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

void main() {
  runApp(AppEntryPoint());
}
