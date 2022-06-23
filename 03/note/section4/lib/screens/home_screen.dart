// 引用 flutter 的核心套件
import 'package:flutter/material.dart';

/// Flutter 渲染畫面的思維是萬物皆為 Widget
///
/// 我們若要做一些視覺化內容，只需建立 class，並繼承 StatelessWidget
/// Flutter 在 StatelessWidget 內有一個未實踐的 build 方法
/// 我們只需要在裡面重新實踐 build 方法，並在最後傳回一個 Widget 型態物件，即可
///
/// Scaffold 相當於一張大畫布，當我們要放入其他內容的時候，會建議在根層放上一個 Scaffold
class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    /// 第一次解析
    // // Scaffold 是 Flutter 預設的 Widget，就像一張大畫布，裡面可以承載多種不同的 Widget
    // return Scaffold(
    //   // 希望在畫布內垂直擺放 Widget，設置了 Column，並置入三個 Widget 在 Children 參數內
    //   body: Column(
    //     children: [
    //         Container(
    //           color: Colors.blue,
    //           child: Text(
    //             "大頭照預留區",
    //             style: TextStyle(fontSize: 30),
    //           ),
    //         ),
    //         Container(
    //           color: Colors.red,
    //           child: Text(
    //             "簡介",
    //             style: TextStyle(fontSize: 30),
    //           ),
    //         ),
    //         Container(
    //           color: Colors.amber,
    //           child: Text(
    //             "座右銘",
    //             style: TextStyle(fontSize: 30),
    //           ),
    //         ),
    //     ],
    //   ),
    // );

    /// 第二次解析
    // // Scaffold 是 Flutter 預設的 Widget，就像一張大畫布，裡面可以承載多種不同的 Widget
    // return Scaffold(
    //   // 希望在畫布內垂直擺放 Widget，設置了 Column，並置入三個 Widget 在 Children 參數內
    //   body: Column(
    //     children: [
    //       // Flutter 是有預設最大畫面長寬的，即為該視窗的大小，如果 Widget 尺寸超過的話，
    //       // 會發生錯誤
    //       // 為了讓他們可以按比例擠在一個視窗內，可以透過 Expanded 再封裝，
    //       // Expanded 會統計，並按照設定比例在螢幕上分配尺寸大小
    //       Expanded(
    //         child: Container(
    //           width: 500,
    //           height: 500,
    //           color: Colors.blue,
    //           child: Text(
    //             "大頭照預留區",
    //             style: TextStyle(fontSize: 30),
    //           ),
    //         ), // Container
    //       ),
    //       // Flutter 是有預設最大畫面長寬的，即為該視窗的大小，如果 Widget 尺寸超過的話，
    //       // 會發生錯誤
    //       // 為了讓他們可以按比例擠在一個視窗內，可以透過 Expanded 再封裝，
    //       // Expanded 會統計，並按照設定比例在螢幕上分配尺寸大小
    //       Expanded(
    //         child: Container(
    //           width: 200,
    //           height: 200,
    //           color: Colors.red,
    //           child: Text(
    //             "簡介",
    //             style: TextStyle(fontSize: 30),
    //           ),
    //         ), // Container
    //       ),
    //       Expanded(
    //         child: Container(
    //           color: Colors.amber,
    //           child: Text(
    //             "座右銘",
    //             style: TextStyle(fontSize: 30),
    //           ),
    //         ),
    //       )
    //     ],
    //   ),
    // );

    /// 第三次解析
    // Scaffold 是 Flutter 預設的 Widget，就像一張大畫布，裡面可以承載多種不同的 Widget
    return Scaffold(
      // 調整長度後，可以讓該部件超過畫面，超過的部分，以滾動檢視
      body: SingleChildScrollView(
        // 希望在畫布內垂直擺放 Widget，設置了 Column，並置入三個 Widget 在 Children 參數內
        child: Column(
          children: [
            Container(
              width: 500,
              height: 500,
              color: Colors.blue,
              child: Text(
                "大頭照預留區",
                style: TextStyle(fontSize: 30),
              ),
            ),
            Container(
              width: 200,
              height: 200,
              color: Colors.red,
              child: Text(
                "簡介",
                style: TextStyle(fontSize: 30),
              ),
            ),
            Container(
              color: Colors.amber,
              child: Text(
                "座右銘",
                style: TextStyle(fontSize: 30),
              ),
            )
          ],
        ),
      ),
    );
  }
}
