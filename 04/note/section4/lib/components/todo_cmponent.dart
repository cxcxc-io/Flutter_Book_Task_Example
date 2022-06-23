import 'package:flutter/material.dart';
import '../models/todo.dart';

/// 程式分層的部分，資料、應用邏輯、視覺邏輯會切割出來
/// 此處為Todo資料定義了一個視覺化組件，可將Todo資料變成一個可勾選刪除，畫線的組件
class TodoComponent extends StatefulWidget {

  // 帶狀態組件的核心資料
  Todo todo;

  // 建構子
  TodoComponent(this.todo);

  // 指定依託的狀態
  @override
  State createState() {
    return _TodoComponentState();
  }
}

/// 宣告為 TodoComponent 的狀態
class _TodoComponentState extends State<TodoComponent> {

  // 實作 build 方法
  @override
  Widget build(BuildContext context) {

    // 設定一個勾選匡， value 的型別必須為 bool，預設為Todo資料的isComplete
    // 設定當用戶勾選時，會對組件重新渲染，將Todo的 isComplete，更改為用戶當前的稽核狀態
    Widget checkTaskCompleteBox = Container(
      child: Checkbox(
        value: this.widget.todo.isComplete,
        // userCheck 的資料型態為 bool，當用戶勾選為 true，用戶沒勾選時為 false
        onChanged: (userCheck) {
          setState(() {
            this.widget.todo.isComplete=userCheck!;
          });
        },
      ),
    );

    // 設定文字，並依照todo資料的 isComplete 做樣式的判斷，若為 true，則有刪除線，
    // 若為 false，則無刪除線
    Widget taskText = Container(
      child: Text(
        this.widget.todo.content,
        // 此處的語法表達方式為 one sentence if else expression，
        // 單句可作為賦值的 if else
        style: (this.widget.todo.isComplete == true) ?
          TextStyle(decoration: TextDecoration.lineThrough) : TextStyle()
      )
    );

    // 將這兩個組件，使用 Row 以水平方式進行放置
    return Container(
      width: 500,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          checkTaskCompleteBox,
          taskText
        ],
      ),
    );
  }
}