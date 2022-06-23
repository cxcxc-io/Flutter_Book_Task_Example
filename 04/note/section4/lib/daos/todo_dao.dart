import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../models/todo.dart';

// 繼承 Provider 套件的 ChangeNotifier，使此類別具備 notifyListeners 函數，
// 當其他類別訂閱此類別，而此類別數據有更新時，會一併通知有訂閱的類別
class TodoDao extends ChangeNotifier {

  // 總資料暫存區
  List<Todo> todoList = [];

  // 取用當前所有Todo的方法
  List<Todo> getTodos() {
    return todoList;
  }

  // 新增Todo，並添加進 todoList，並通知有訂閱 TodoDao 的類別
  void insertTodo(String inputContent) {
    todoList.add(Todo(false, inputContent));
    notifyListeners();
  }

  // 更新Todo
  // 當用戶勾選確認完成時，更新Todo內容，並塞回todoList，並通知有訂閱 TodoDao 的類別
  void updateTodo(Todo todo) {
    todoList[todoList.indexOf(todo)] = todo;
    notifyListeners();
  }

}
