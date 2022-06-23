// 引用 flutter 的核心套件
import 'package:flutter/material.dart';
import 'package:section8/components/common_drawer.dart';

/// 首頁面
///
/// 首頁會回傳一個文字按鈕，當點擊時，跳轉到第二頁
class HomeScreen extends StatelessWidget {

  /// 說明
  ///
  /// 為了展示 Drawer 側邊欄，必須要先建置一個 AppBar 在畫面的頂端，並將其放入 Scaffold 的
  /// appBar 參數
  /// 進一步調度 CommonDrawer 的 getDrawer 函數，生成 Drawer，放入 Scaffold 的 drawer
  /// 參數
  /// 頁面參數的部分，與先前案例相同
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      drawer: CommonDrawer.getDrawer(context),
      body: TextButton(
        child: Text("切換到第二頁"),
        onPressed: () {
          Navigator.pushNamed(context, "/second");
        },
      ),
    );

  }
}