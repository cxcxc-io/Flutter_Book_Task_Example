import 'package:flutter/material.dart';
import 'screens/user_screen.dart';

void main() {
  runApp(AppEntryPoint());
}

class AppEntryPoint extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/get-users": (BuildContext context) => UserScreen()
      },
      initialRoute: "/get-users",
    );
  }
}