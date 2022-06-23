// 引用 Flutter 的核心套件
import 'package:flutter/material.dart';
import 'package:section9/components/common_drawer.dart';

class BookScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: CommonDrawer.getDrawer(context),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                child: Image(image: AssetImage("assets/cloud_architecture.jpg"),
                ),
              ),
              Container(
                child: Text(
                  "大話 AWS 雲端架構",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w400),
                ),
              ),
              Container(
                child: TextButton(
                  child: Text("跳轉前一頁"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Container(
                child: TextButton(
                  child: Text("未來技術趨勢"),
                  onPressed: () {
                    Navigator.pushNamed(context, "/aws-saa-class");
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}