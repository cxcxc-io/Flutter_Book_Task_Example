// 引用 flutter 的核心套件
import 'package:flutter/material.dart';
import 'package:section8/components/common_drawer.dart';

/// 第二頁面
///
/// 第二頁 簡單回傳文字
class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 新增 appbar
      appBar: AppBar(),
      // 新增 drawer
      drawer: CommonDrawer.getDrawer(context),
      body: TextButton(
        child: Text("彈回主頁"),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}