import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/colorful_demo_screen.dart';
import 'screens/todo_input_demo_screen.dart';
import 'screens/count_todo_demo_screen.dart';
import 'daos/todo_dao.dart';

void main() {
  runApp(
    // 每一個 Provider 都是一個共享狀態
    // MultiProvider裡面可以放 providers，分享多個狀態給 Flutter 主應用
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TodoDao())
      ],
      child: AppEntryPoint()
    )
  );
}

// Flutter 主應用
class AppEntryPoint extends StatelessWidget {

  // This Widget is the root of your application
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "cxcxc_statefulWidget_demo",
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      routes: {
        "/color-demo": (BuildContext context) => ColorfulDemoScreen(),
        "/task": (BuildContext context) => TodoInputDemoScreen(),
        "/amount": (BuildContext context) => CountTodoDemoScreen()
      },
      initialRoute: "/task",
    );
  }
}