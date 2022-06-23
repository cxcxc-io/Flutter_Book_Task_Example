import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "/third");
              },
              child: Text("前往第三個頁面")
          ),
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("跳轉前頁")
          )
        ],
      ),
    );
  }
}