import 'package:flutter/material.dart';

class BreadcrumbDrawer {

  static Drawer getDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            title: Text("第一個頁面"),
            onTap: () {
              Navigator.pushNamed(context, "/first");
            },
          ),
          ListTile(
            title: Text("第二個頁面"),
            onTap: () {
              Navigator.pushNamed(context, "/second");
            },
          )
        ],
      ),
    );
  }
}