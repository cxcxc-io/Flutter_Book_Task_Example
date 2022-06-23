// 引用 flutter 的核心套件
import 'package:flutter/material.dart';

/// 第二頁面
///
/// 第二頁會回傳一個文字按鈕，當點擊時，跳轉回前頁
class SecondScreen extends StatelessWidget {

  /// 設置文字按鈕
  ///
  /// 設置了一個文字按鈕
  /// child 填入 Text Widget，
  /// onPressed 為一個無參數的方法
  /// 由於要跳轉分頁的緣故，使用 Flutter 預設的物件 Navigator
  /// 其有 pop 方法，使用時，會跳轉回上一頁，填入參數 context 即可
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: TextButton(
        child: Text("彈回主頁"),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
