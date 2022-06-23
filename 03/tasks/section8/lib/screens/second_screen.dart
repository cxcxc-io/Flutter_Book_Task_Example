import 'package:flutter/material.dart';
import 'package:section8/components/breadcrumb_drawer.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: BreadcrumbDrawer.getDrawer(context),
      body: Text("第二個頁面"),
    );
  }
}