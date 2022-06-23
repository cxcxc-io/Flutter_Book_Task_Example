// 引用 flutter 的核心套件
import 'package:flutter/material.dart';

class CommonDrawer {

  /// 類別的靜態方法
  ///
  /// static 可讓我們不需創建 CommonDrawer 物件，即可調度 getDrawer 函數
  ///
  /// getDrawer 函數
  /// 調度時，需放入 Flutter 用來記錄頁面構建資訊的 BuildContext，而後會回傳一個 Drawer
  static Drawer getDrawer(BuildContext context) {
    return Drawer(
      /// child 參數：可接 Column 或 ListView，官方網站推薦使用 ListView
      /// Column 在使用時，得考慮會操作螢幕屏幕
      child: ListView(
        children: [
          ListTile(
            title: const Text("主頁"),
            onTap: () {
              // 轉發至首頁
              Navigator.pushNamed(context, "/");
            },
          ),
          ListTile(
            title: const Text("第二個分頁"),
            onTap: () {
              // 轉發至第二分頁
              Navigator.pushNamed(context, "/second");
            },
          )
        ],
      ),
    );
  }
}