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
    // // Widget 邊界內縮
    // // margin 就是與父 Widget 以內縮的方式保持距離
    // return Scaffold(
    //   // 掛 Container，背景為藍色，會將完整載具頁面給其他 body container
    //   // 設置 margin，讓藍色 Widget 與載具有 20 個畫素的間距
    //   body: Container(
    //     margin: EdgeInsets.all(20),
    //     color: Colors.blue,
    //     // 在藍色 Widget 內增加一個子 Widget
    //     // 並讓此 Widget 為紅色
    //     // 並與父 Widget 保持縮排 20 個畫素
    //     child: Container(
    //       margin: EdgeInsets.all(20),
    //       color: Colors.red,
    //       // 在紅色 Widget 內增加一個子 Widget
    //       // 並讓此 Widget 為黑色
    //       // 並與父 Widget 保持縮排 20 個畫素
    //       child: Container(
    //         margin: EdgeInsets.all(20),
    //         color: Colors.black,
    //       ),
    //     ),
    //   ),
    // );

    /// 第二次解析
    // Widget 邊界內縮
    // margin 就是與父 Widget 以內縮的方式保持距離
    //
    // 排版與尺寸的併行討論
    //
    // 在古早電視劇裡，父親的權威性，不容質疑，父親可以決定兒子的住所，兒子可以決定孫子的住所。
    // 雖說可以安排，但總不能沒有給一點盤纏，就讓人移動吧？
    //
    // 關於盤纏，父愛是只要他有，就會儘量給予的，如果兒子沒有提出需要的零用錢數量，那基於父愛，
    // 就會把所有的現金都給兒子。
    // 如果兒子有提出需要的零用錢數量，父親就會在能力範圍內，按照兒子提出的數量進行給予
    //
    // 子 Widget 的位置，是不能自行決定的。得透過父 Widget 的安排，但在安排版面之前，必須要
    // 設定 Widget 的尺寸，這樣一來排版才能生效
    //
    // 子 Widget 的最大尺寸，受到父 Widget 的最大尺寸限制，如果子 Widget 沒有提出尺寸，
    // 那父 Widget 會給予所有的空間
    // 如果子 Widget 有提出需要的尺寸，父 Widget 就會在父 Widget 的最大尺寸內進行給予
    return Scaffold(
      // 最高父 Widget 為 Scaffold
      // 第一層 Container 只需要 500 的長寬
      // 第一層 Container 要求，第二層 Container 必須要放在中上方
      body: Container(
        alignment: Alignment.topCenter,
        width: 500,
        height: 500,
        margin: EdgeInsets.all(20),
        color: Colors.blue,
        // 第一層 Container 尺寸最多為 500 x 500
        // 第二層 Container 只需要 200 ，故可以完整呈現
        // 第二層 Container 要求，第三層 Container 必須要放在右下方
        child: Container(
          alignment: Alignment.bottomRight,
          width: 200,
          height: 200,
          margin: EdgeInsets.all(20),
          color: Colors.red,
          // 第二層 Container 尺寸最多為 200 x 200
          // 第三層 Container 只需要 100 x 100 ，故可以完整呈現
          child: Container(
            width: 100,
            height: 100,
            margin: EdgeInsets.all(20),
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}