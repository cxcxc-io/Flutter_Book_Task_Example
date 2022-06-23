import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FutureBuilderDemoScreen extends StatelessWidget {

  /// 跟外部要資料
  ///
  /// 由於跟外部系統要資料，並不能確保回應時間，通常會用 [Future] 進行包覆
  /// 告訴 Flutter 說，不要讓主程序等待這個行為，避免整個畫面延宕等待
  Future<dynamic> getDataFromRemote() async {

    // 解析遠端系統網址
    var url = Uri.parse("https://jsonplaceholder.typicode.com/posts");
    // 透過 http 的 get 方法，訪問該網址
    var response = await http.get(url);
    // 回結果的封包內容
    return response.body;
  }

  @override
  Widget build(BuildContext context) {

    /// 使用 FutureBuilder
    ///
    /// 此建構子的功能，當我們跟外部系統要資料的時候，可以先用一個預設資料做基礎渲染
    /// 等到資料取回之後，再重新渲染一次
    /// [future] 接一個回傳值，為 Future 的函數
    /// [initialData] 接預設資料，在此我們設一個空陣列
    /// [builder] 必須接一個匿名函數，有兩個可調用的參數
    ///     第一個參數為記錄所有狀態的 context
    ///     第二個參數為 Future 傳回來的數據
    return FutureBuilder(
        future: getDataFromRemote(),
        initialData: [],
        builder: (BuildContext context, AsyncSnapshot<dynamic> asyncSnapshot) {
          // print(asyncSnapshot.data);
          return Scaffold(
            body: Text(asyncSnapshot.data.toString()),
          );
        }
    );
  }
}
