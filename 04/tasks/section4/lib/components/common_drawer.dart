import 'package:flutter/material.dart';

class CommonDrawer {
  static Drawer getDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            title: Text("換色換形狀的 Demo"),
            onTap: () {
             Navigator.pushNamed(context, "/change-sate");
            }
          ),
          ListTile(
              title: Text("簡易計算機"),
              onTap: () {
                Navigator.pushNamed(context, "/calculator");
              }
          ),
          ListTile(
              title: Text("計算機使用狀況紀錄"),
              onTap: () {
                Navigator.pushNamed(context, "/usage-analysis");
              }
          )
        ],
      ),
    );
  }
}