// 引用 flutter 的核心套件
import 'package:flutter/material.dart';

/// 首頁面
///
/// 首頁會回傳一個文字按鈕，當點擊時，跳轉到第二頁
class HomeScreen extends StatelessWidget {

  /// 設置文字按鈕
  ///
  /// 設置了一個文字按鈕
  /// child 填入 Text Widget，
  /// onPressed 為一個無參數的方法
  /// 由於要跳轉分頁的緣故，使用 Flutter 預設的物件 Navigator
  /// 其有 pushNamed 方法，填入參數 context 以及要跳轉的分頁
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: TextButton(
        child: Text("切換到第二頁"),
        onPressed: () {
          Navigator.pushNamed(context, "/second");
        },
      ),

    );
  }
}