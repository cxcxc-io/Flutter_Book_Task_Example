import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "/second");
              },
              child: Text("前往第二頁面")
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