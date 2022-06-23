/// 依照文件的先期設定，設定側邊欄以及其點擊後的轉發路徑
// 引用 Flutter 的核心套件
import 'package:flutter/material.dart';

class CommonDrawer {

  /// 設置 getDrawer 靜態函數，無需建立物件，即可呼叫此方法
  /// 使用後回傳一個 Drawer，使用時必須放入 BuildContext 引數，此物是記錄 Flutter App
  /// 的頁面關聯狀態的物件
  /// 設置 Drawer，並在裡面安置 ListView，讓選項超過畫面時，仍可滑動。
  /// 為 ListView 分別置入 ListTitle，點擊時，會轉發至指定頁面
  static Drawer getDrawer(BuildContext context) {
    return Drawer(

      // 避免按鍵過多時，超過畫面而異常，使用 ListView
      child: ListView(
        // 放入 ListView 專用的
        children: [
          ListTile(
            title: const Text("色塊變化"),
            onTap: () {
              // 轉發至色塊變化頁面，初步展示 StatefulWidget
              Navigator.pushNamed(context, "/color-demo");
            },
          ),
          ListTile(
            title: const Text("工作記錄"),
            onTap: () {
              // 轉發至todo登記頁面
              Navigator.pushNamed(context, "/task");
            },
          ),
          ListTile(
            title: const Text("工作數量"),
            onTap: () {
              // 切換至todo數量統計頁面
              Navigator.pushNamed(context, "/amount");
            },
          )
        ],
      ),
    );
  }
}