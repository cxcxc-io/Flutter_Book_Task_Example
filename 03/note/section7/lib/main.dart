import 'package:flutter/material.dart';
import 'package:section7/screens/home_screen.dart';
import 'package:section7/screens/second_screen.dart';

class AppEntryPoint extends StatelessWidget {

  /// 說明
  ///
  /// MaterialApp 就像是核心必備的大畫框，
  /// 透過 routes 參數，可指定路徑對應到不同的 Screen
  /// initialRoute 為預設讀取的位置
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      // "路徑名": (BuildContext context) => 頁面物件
      routes: {
        "/": (BuildContext context) => HomeScreen(),
        "/second": (BuildContext context) => SecondScreen()
      },
      initialRoute: "/",
    );
  }
}

/// Dart 程式的主要入口
///
/// 告知 Dart，啟動 AppEntryPoint
void main() {
  runApp(AppEntryPoint());
}