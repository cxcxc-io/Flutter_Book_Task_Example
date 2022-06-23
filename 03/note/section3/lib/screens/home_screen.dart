// 引用 Flutter 的核心套件
import 'package:flutter/material.dart';

/// Flutter 渲染畫面的思維是萬物皆為 Widget
///
/// 我們若要做一些視覺話內容，只需建立 class，並繼承 StatelessWidget
/// Flutter 在 StatelessWidget 內有一個未實踐的 build 方法
/// 我們只需要在裡面重新實踐 build 方法，並在最後傳回一個 Widget 型態的物件，即可
///
/// Scaffold 相當於一張大畫布，當我們要放入其他內容的時候，會建議在根層放上一個 Scaffold
class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    // Scaffold 是 Flutter 預設的 Widget，就像一張大畫布，裡面可以承載多種不同的 Widget
    return Scaffold(
      // 設置了核心元件 container，並設計了他的大小與底色，並嵌入了 Text，Text 有一個參數
      // 可以調整字體大小，如下面案例
      body: Container(
        width: 500,
        height: 500,
        color: Colors.blue,
        child: Text(
          "個人首頁的粗搞",
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
