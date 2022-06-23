import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/common_drawer.dart';
import '../components/todo_cmponent.dart';
import '../daos/todo_dao.dart';

/// 為了讓畫面具有動態效果，繼承 StatefulWidget
/// 為了有效保存用戶的任務輸入，在裡面設計了一個 List，名為 todoList，用來存放用戶的輸入
/// 透過 createState 函數，調動 _TodoInputDemoScreen 這個 State 類別
class TodoInputDemoScreen extends StatefulWidget {

  // TODO: 書上這一段沒有拿掉
  // // 保存用戶輸入的任務資料
  // List<String> todoList = [];

  // StatefulWidget 的變化笑過出自於這個 createState 函數。
  @override
  State createState() {
    return _TodoInputDemoScreen();
  }
}

class _TodoInputDemoScreen extends State<TodoInputDemoScreen> {

  // 每次畫面渲染所執行的函數
  @override
  Widget build(BuildContext context) {

    // 在使用 TextField 的時候，輸入完成後，先前的內容仍會留在上面
    // 為使用文字消息，必需使用新的 TextEditingController，並當 TextField 的參數
    var textEditingController = TextEditingController();

    // 文字輸入框
    Widget userInputTextField = Container(
      width: 500,
      child: TextField(
        // decoration 為裝飾，我們使用 InputDecoration 進行外觀變化
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: '請輸入要執行的任務'
        ),
        // 用戶要輸入的字，都先經由此 controller，後轉發到其他功能
        controller: textEditingController,
        // 當用戶點擊enter時，傳入先前說所輸入的文字，並觸發 setState，渲染畫面
        onSubmitted: (inputValue) {
          setState(() {
            // 透過管理總頁面狀態的 context，去讀取 Provider 提供的 TodoDao，
            // 並調用 insertTodo 函數，插入資料
            context.read<TodoDao>().insertTodo(inputValue);
            // 清空輸入文字框
            textEditingController.clear();
          });
        },
      ),
    );

    // 回傳頁面，要求靠頂部置中
    return Scaffold(
      appBar: AppBar(),
      drawer: CommonDrawer.getDrawer(context),
      body: Container(
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            // 文字輸入框
            userInputTextField,
            // 用戶所輸入的內容
            // 三個點的意思是使該 List 成為 children 內的元素
            // 透過管理總頁面狀態的 context，去讀取 Provider 提供的 TodoDao，
            // 並使用 getTodos 調度所有todo
            ...context.watch<TodoDao>().getTodos().map(
                    (taskTodo) => Container(child: TodoComponent(taskTodo))
            ).toList()
          ],
        ),
      ),
    );
  }
}