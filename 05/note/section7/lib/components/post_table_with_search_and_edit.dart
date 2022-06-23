import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/post.dart';

class PostTableWithSearchEdit extends StatefulWidget {

  List<Post> posts;

  PostTableWithSearchEdit(this.posts);

  @override
  State createState() {
    return _PostTableWithSearchEdit();
  }
}

class _PostTableWithSearchEdit extends State<PostTableWithSearchEdit> {

  List<Post> filteredPosts = [];

  void changeFilteredPosts(String userInput) {

    // 使用 where 函數，針對資料進行篩選
    filteredPosts = this.widget.posts.where((element) {
      // 若用戶不輸入任何內容，則全部保留
      if (userInput == "") {
        return true;
        // 若用戶有輸入內容，且在 Post 的 title 欄位內有用戶所輸入的文字，則保留
      } else if (element.title.contains(userInput)) {
        print(element.title);
        return true;
        // 若 Post 的 title 與用戶輸入內容不同，則剔除
      } else {
        return false;
      }
    }).toList();

    // 若查詢後，filteredPosts 的長度為 0，代表查無資料，故增加一筆假資料，告知查無資料
    if (filteredPosts.length == 0) {
      filteredPosts.add(Post(999, 999, "查無資料", "查無資料"));
    }
  }

  @override
  Widget build(BuildContext context) {

    if (filteredPosts.length == 0) {
      changeFilteredPosts("");
    }

    var searchTextEditingController = TextEditingController();

    // SearBar
    Widget searchBar = TextField(
      controller: searchTextEditingController,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        hintText: "Enter a search term to search Title"
      ),
      onSubmitted: (inputStr) {
        setState(() {
          changeFilteredPosts(inputStr);
        });
      },
    );

    // 取出第一筆數據，轉換成 Json，並將欄位提取出來，成為一個陣列，裡面放置資料鍵的字串
    List<String> columnName = (jsonDecode(filteredPosts[0].toJsonObjectString()) as Map<String, dynamic>).keys.toList();

    // 將資料鏈逐個轉換成 DataColumn，一個一個的表格欄位
    List<DataColumn> dataColumns = columnName.map((key) {
      return DataColumn(
        label: Text(key)
      );
    }).toList();

    // 將 posts 裡面的 Post，讀取出來
    // 將該 Post 的變數與內容，並將其轉換成 DataCell
    // 而後整併成一個 DataRow
    // 最後將 posts 整理成一個 List<DataRow>
    List<DataRow> dataRows = filteredPosts.map((post) {

      // 將 Post 物件，轉換成一個集合鍵值
      Map<String, dynamic> postJson = jsonDecode(post.toJsonObjectString()) as Map<String, dynamic>;

      // 依據我們要呈現的欄位，把 Post 符合該欄位的內容提取出來，並轉換成 DataCell，而後整成一個 List
      List<DataCell> dataCells = columnName.map((key) {
        return DataCell(

          // 由於要開放用戶編輯，從先前的 Text 改為 TextField
          // 仍有顯示資料的需求，此刻透過 TextEditingController 的 text 參數，進行顯示
          // onSubmitted 編寫一個函數，使用 http 模組的 post 函數，把修改後的內容，傳回遠端系統
          TextField(
            controller: TextEditingController(text: postJson[key].toString()),
            onSubmitted: (inputStr) {
              // 將 postJson 該欄位的內容，換成用戶修改的內容
              postJson[key] = inputStr;
              print(postJson);

              // 設定遠端系統位置
              var url = Uri.parse("https://jsonplaceholder.typicode.com/posts");

              // 傳回遠端
              var responseOfFuture = http.post(url, body: jsonEncode(postJson));
              // 將遠端系統回傳的結果印出來
              responseOfFuture.then((value) => print(value.body));
            },
          )
        );
      }).toList();

      return DataRow(
        cells: dataCells
      );
    }).toList();

    // 擔心超過畫面高度，使用 SingleChildScrollView，萬一內容超過頁面時，可用滾輪畫動檢索
    return SingleChildScrollView(
      child: Container(
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            Container(
              width: 800,
              child: searchBar,
            ),
            Container(
              width: 800,
              child: DataTable(
                columns: dataColumns,
                rows: dataRows,
              ),
            ),
          ],
        ),
      ),
    );
  }
}