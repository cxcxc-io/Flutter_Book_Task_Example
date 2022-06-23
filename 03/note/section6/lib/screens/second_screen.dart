// 引用 Flutter 的核心套件
import 'package:flutter/material.dart';

/// 第二頁面 - 簡單回傳文字
class SecondScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Text(
        "第二個頁面"
      ),
    );
  }
}