import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        alignment: Alignment.bottomLeft,
        color: Colors.blue,
        child: Container(
          height: 500,
          width: 500,
          color: Colors.yellow,
        ),
      ),
    );
  }
}