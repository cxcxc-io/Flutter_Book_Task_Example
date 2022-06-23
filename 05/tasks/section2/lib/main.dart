import 'package:flutter/material.dart';
import 'screens/getRemoteDataScreen.dart';

void main() {
  runApp(AppEntryPoint());
}

class AppEntryPoint extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/get-users": (BuildContext context) => GetRemoteDataScreen(),
      },
      initialRoute: "/get-users",
    );
  }
}