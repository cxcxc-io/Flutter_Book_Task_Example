import 'package:flutter/material.dart';
import '../components/common_drawer.dart';

/// 設計 StatefulWidget，設定新狀態與保存狀態
/// 未來用戶操作頁面時，可即時更換該內容，對畫面重新渲染變化
class ColorfulDemoScreen extends StatefulWidget {

  // 用來判斷顏色是否為紅色的變數
  bool currentColorIsRed = true;

  // 傳回一個類別為 State<ColorfulDemoScreen> 的物件
  @override
  State createState() {
    return _ColorfulDemoScreenState();
  }
}

/// 建立 State，供 Stateful Widget 觸發 setState 時，重新進行 build 函數，進行畫面繪製
class _ColorfulDemoScreenState extends State<ColorfulDemoScreen> {

  // 與先前 StatelessWidget 的 build 函數雷同，用來進行畫面的繪製
  @override
  Widget build(BuildContext context) {

    // 為了讓學員方便觀察，點擊按鍵前後的狀態屬性變化，在用戶尚未點擊按鍵時，
    // 就先行檢閱屬性一次。
    print("進入 build 函數時，widget 的 currentColorIsRed");
    print(this.widget.currentColorIsRed);

    // 依照新屬性，重新建置一個帶顏色的容器。
    // 當 widget 的 currentColorIsRed 為 true 時，則印製紅色容器
    // 當 widget 的 currentColorIsRed 為 false 時，則印製藍色容器
    Widget colorfulContainer;
    if (this.widget.currentColorIsRed == true) {
      colorfulContainer = Container(
          color: Colors.red,
          width: 300,
          height: 300
      );
    } else {
      colorfulContainer = Container(
          color: Colors.blue,
          width: 300,
          height: 300
      );
    }

    // 設置一個 Column，在第一列建立一個文字按鈕，在第二列傳入一個可變化頁面的 Widget
    return Scaffold(
      appBar: AppBar(),
      drawer: CommonDrawer.getDrawer(context),
      body: Container(
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            Container(
              // 設置一個文字按鈕
              // 當點擊時，變化原 Widget 的 currentColorIsRed 變數
              child: TextButton(
                child: Text("按我會變色"),
                onPressed: () {
                  // 觸發 setState() {}，Flutter 會重新執行 build 函數，
                  // 重新進行頁面渲染
                  setState(() {
                    print("用戶點擊過程中，widget 的 currentColorIsRed 屬性");
                    print(this.widget.currentColorIsRed);
                    // 變更原來 Widget 的屬性
                    this.widget.currentColorIsRed=!this.widget.currentColorIsRed;
                    print("用戶點擊過程後，widget 的 currentColorIsRed 屬性，重新賦值");
                    print(this.widget.currentColorIsRed);
                  });
                },
              ),
            ),
            // 將先前依照 currentCoolorIsRed 的 Widget，經畫面渲染後，至於此處
            colorfulContainer,
          ],
        ),
      ),
    );
  }
}