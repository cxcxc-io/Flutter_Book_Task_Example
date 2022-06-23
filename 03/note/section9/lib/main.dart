import 'package:flutter/material.dart';
import 'package:section9/screens/home_screen.dart';
import 'package:section9/screens/aws_saa_class.dart';
import 'package:section9/screens/book_screen.dart';

class AppEntryPoint extends StatelessWidget {

  /// 說明
  ///
  /// MaterialApp 就像是核心必備的大畫框，
  /// 透過 routes 參數，可指定路徑對應到不同的 Screen
  /// initialRoute 為預設讀取的位置
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        // "路徑名": (BuildContext context) => 頁面物件
        "/": (BuildContext context) => HomeScreen(),
        "/cloud-architecture-guide": (BuildContext context) => BookScreen(),
        "/aws-saa-class": (BuildContext context) => AwsSaaClassScreen()
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