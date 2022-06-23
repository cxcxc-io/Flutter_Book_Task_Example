import 'dart:convert';
import 'package:flutter/material.dart';
import '../models/post.dart';

class PostTable extends StatelessWidget {

  // List<Post>，之後要進行畫面渲染，必須要有資料，故設此變數，後續用於建構子，
  // 之後他人使用時，必須給予一個 List<Post>
  List<Post> posts;

  PostTable(this.posts);

  @override
  Widget build(BuildContext context) {

    // 取出第一筆數據，轉換成 Json，並將欄位提取出來，成為一個陣列，裡面放置資料間的字串
    List<String> columnName = (jsonDecode(posts[0].toJsonObjectString()) as Map<String, dynamic>).keys.toList();

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
    List<DataRow> dataRows = posts.map((post) {
      // 將 Post 物件，轉換成一個集合鍵值
      Map<String, dynamic> postJson = jsonDecode(post.toJsonObjectString()) as Map<String, dynamic>;

      // 依據我們要呈現的欄位，把 Post 符合該欄位的內容提取出來，並轉換成 DataCell，而後整成一個 List
      List<DataCell> dataCells = columnName.map((key) {
        return DataCell(
          Text(postJson[key].toString())
        );
      }).toList();

      // 每一列 DataRow 要生成時，必須要用 List<DataCell> 當建構子，將先前的 List<DataCell> 放入
      return DataRow(
        cells: dataCells
        );
      }).toList();

    // DataTable，將身為 List<DataColumn> 的 dataColumn 與身為 List<DataRow> 的 dataRow 當作建構子放入
    return DataTable(
        columns: dataColumns,
        rows: dataRows
    );
  }
}