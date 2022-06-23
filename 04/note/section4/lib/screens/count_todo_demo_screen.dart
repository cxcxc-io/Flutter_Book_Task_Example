import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/common_drawer.dart';
import '../daos/todo_dao.dart';

class CountTodoDemoScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      drawer: CommonDrawer.getDrawer(context),
      // 請context讀取TodoDao，並調度此共享狀態的getTodos函數，取得todoList，
      // 並量測數量，轉為字串，貼回
      body: Container(
        child: Text("目前的Todo數量為 " +
            context.read<TodoDao>().getTodos().length.toString()),
      ),
    );
  }
}