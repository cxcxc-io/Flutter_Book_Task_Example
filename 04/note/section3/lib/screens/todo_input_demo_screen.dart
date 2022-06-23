import 'package:flutter/material.dart';

/// 為了讓畫面具有動態效果，繼承 StatefulWidget
/// 為了有效保存用戶的任務輸入，在裡面設計了一個 List，名為 todoList，用來存放用戶的輸入
/// 透過 createState 函數，調動 _TodoInputDemoScreen 這個 State 類別
class TodoInputDemoScreen extends StatefulWidget {

  // 保存用戶輸入的任務資料
  List<String> todoList = [];

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
            // 將內容放入 List
            this.widget.todoList.add(inputValue);
            // 清空輸入文字框
            textEditingController.clear();
          });
        },
      ),
    );

    return Scaffold(
      body: Container(
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            // 文字輸入框
            userInputTextField,
            // 用戶所輸入的內容
            // 三個點的意思是使該 List 成為 children 內的元素
            ...this.widget.todoList.map((taskString) => Text(taskString)).toList()
          ],
        ),
      ),
    );
  }
}