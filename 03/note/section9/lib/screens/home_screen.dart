// 引用 Flutter 的核心套件
import 'package:flutter/material.dart';
// 引入 components 裡面的側邊欄組件
import 'package:section9/components/common_drawer.dart';

class HomeScreen extends StatelessWidget {

  /// 說明
  ///
  /// 建置 Scaffold，而後在裡面放置 appBar，再放入 component 所設計的側邊欄
  /// 考量頁面內容有可能超過整個載具，
  /// 使用 SingleChildView，當畫面超過載具呈現大小時，會出現滾動條，使我方可滾動觀看頁面
  /// 將整個版面至中，為了垂直擺放多個 Widget，引入 Column，在裡面分別放入照片、文字、按鍵。
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 設定空標題列
      appBar: AppBar(),
      // 引入先前設定的側邊欄
      drawer: CommonDrawer.getDrawer(context),
      // 單一滾動檢視，引入更多組件
      body: SingleChildScrollView(
        // 放入一個 Container，留下未來可調整的彈性
        child: Container(
          // 排版置中
          alignment: Alignment.center,
          child: Column(
            // 安排需要放進去的組件
            children: [
              Container(
                child: Text(
                  "雲育鏈 Line@ QRCode",
                  style: TextStyle(fontSize: 28),
                ),
              ),
              // 放入圖片，透過 AssetImage 指定放在 assets 資料夾的 cxcxc_line.png
              // 此處不用寫 assets 的緣故是已在 pubspec.yaml 內指明 assets
              Container(
                child: Image(image: AssetImage("assets/cxcxc_line.png"),),
              ),
              Container(
                child: Text("掃了不會有好康。"),
              ),
              // 放入一個文字按鈕，設定點擊後的頁面導向
              Container(
                child: TextButton(
                  child: Text("單身神功秘笈"),
                  onPressed: () {
                    Navigator.pushNamed(context, "/cloud-architecture-guide");
                  },
                ),
              ),
              // 放入一個文字按鈕，設定點擊後的頁面導向
              Container(
                child: TextButton(
                  child: Text("未來技術趨勢"),
                  onPressed: () {
                    Navigator.pushNamed(context, "aws-saa-class");
                  },
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}
