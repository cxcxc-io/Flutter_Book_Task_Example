import 'package:flutter/material.dart';
import 'package:section4/screens/home_screen.dart';

/// Flutter 程式的主要入口
///
/// 在 Flutter 的思想裡，萬物都是 Widget，也只有 Widget 可以被渲染在用戶的載具畫面上
/// 故 AppEntryPoint 也必須是 Widget，才能順利在 Flutter 框架下運行
/// 為使 AppEntryPoint 是 Widget，讓其繼承 StatelessWidget
class AppEntryPoint extends StatelessWidget {

  /// Material 就像是核心必備的大畫框
  ///
  /// home 參數接入 Widget，一般多接 Scaffold 為基礎的 Widget
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: HomeScreen()
    );
  }
}

/// Dart 程式的主要入口
///
/// 告知 Dart，啟動 AppEntryPoint
void main() {
  runApp(AppEntryPoint());
}