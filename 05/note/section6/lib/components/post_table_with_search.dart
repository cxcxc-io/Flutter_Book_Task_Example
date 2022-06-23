import 'dart:convert';
import 'package:flutter/material.dart';
import '../models/post.dart';

class PostTableWithSearch extends StatefulWidget {

  List<Post> posts;

  PostTableWithSearch(this.posts);

  @override
  State createState() {
    return _PostTableWithSearch();
  }
}

class _PostTableWithSearch extends State<PostTableWithSearch> {

  // 用來存放已經篩選好的 Post
  List<Post> filteredPosts = [];

  void changeFilterPosts(String userInput) {

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

    // 若已過濾的 Post 陣列為零，代表尚未過濾
    if (filteredPosts.length == 0) {
      changeFilterPosts("");
    }

    // 建立一個新的文字控制器
    var searchTextEditingController = TextEditingController();

    // 建立文字輸入框
    Widget searchBar = TextField(
      // 將剛剛建立的文字控制器放入
      controller: searchTextEditingController,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        hintText: "Enter a search term to search Title"
      ),
      onSubmitted: (inputStr) {
        // 渲染畫面
        setState(() {
          changeFilterPosts(inputStr);
        });
      },
    );

    // 將該字串陣列轉成 DataColumn
    List<String> columnName = (jsonDecode(filteredPosts[0].toJsonObjectString()) as Map<String, dynamic>).keys.toList();
    List<DataColumn> dataColumns = columnName.map((key) {
      return DataColumn(
          label: Text(key),
      );
    }).toList();

    // 用已過濾的 Post 陣列，逐筆轉化成 DataRow
    List<DataRow> dataRows = filteredPosts.map((post) {
      // 轉換單筆 Post，變成 Map 資料結構
      Map<String, dynamic> postJson = jsonDecode(post.toJsonObjectString()) as Map<String, dynamic>;
      // 依照我們要查詢用的欄位，提取 Post 的資料內容，並轉化成 DataCell
      List<DataCell> dataCells = columnName.map((key) {
        return DataCell(
          Text(postJson[key].toString())
        );
      }).toList();

      // 將 DataCell 整併成一條 DataRow
      return DataRow(
          cells: dataCells
      );
    }).toList();

    // 擔心超過畫面高度，使用 SingleChildScrollView，萬一內容超過頁面時，可用滾輪畫動檢索
    return SingleChildScrollView(
      child: Container(
        alignment: Alignment.topCenter,

        // 先放入搜尋列置頂
        // 再放入資料表
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