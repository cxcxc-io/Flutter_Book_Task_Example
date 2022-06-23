import 'dart:convert';
import 'package:flutter/material.dart';
import '../daos/post_dao.dart';
import '../models/post.dart';

/// 一個視覺化組件，將遠端系統的數據，以純文字的方式表達
class PostText extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // 由於需要透過 PostDao 跟外部系統票度資料，而跟外部系統調度資料時，是不可預期效能的
    // 故 PostDao 在跟外部系統溝通時，用 Future 隔離環境
    // 為了要能夠讓跟外部系統調度數據的 Future 能夠有效地將資料做渲染
    // 可透過 FutureBuilder，配置 Future、起始數據，以及渲染方式
    return FutureBuilder(
        // 請 PostDao使用調度外部系統資料的 Future 函數
        future: PostDao.getPost(),

        // 告知 Flutter，取用資料後，必須如何進行資料渲染
        builder: (BuildContext context, AsyncSnapshot<List<Post>> asyncSnapshot) {

          // 一個空陣列
          List<Widget> widgets = [];

          // 確認與遠端系統交互的連線狀態
          print(asyncSnapshot.connectionState);
          // 確認是否已取得資料
          print(asyncSnapshot.hasData);

          // 如果連線狀態為已完成，則取用數據，並轉換成Text
          if (asyncSnapshot.connectionState == ConnectionState.done) {
            widgets = asyncSnapshot.requireData.map((post) {
              return Text(post.toJsonObjectString());
            }).toList();
          }

          // 由於數據量可能過大，使用 SingleChildScrollView，使可用滑鼠滾動，瀏覽超過頁面的資料
          return SingleChildScrollView(
            child: Column(
              children: widgets,
            ),
          );
        }
    );
  }
}