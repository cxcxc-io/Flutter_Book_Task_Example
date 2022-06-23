import 'package:flutter/material.dart';

class ThirdScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "/first");
              },
              child: Text("前往第一個頁面")
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