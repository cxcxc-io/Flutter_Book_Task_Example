import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flat/flat.dart';

import '../models/user.dart';

class UserTableWithSearchEdit extends StatefulWidget {

  List<User> users;

  UserTableWithSearchEdit(this.users);

  @override
  State<StatefulWidget> createState() {
    return _UserTableWithSearchEdit();
  }
}

class _UserTableWithSearchEdit extends State<UserTableWithSearchEdit> {

  List<User> filteredUsers = [];

  void changeFilteredUsers(String userInput) {

    filteredUsers = this.widget.users.where((user) {
      if (userInput == "") {
        return true;
      } else if (user.email.contains(userInput)) {
        print(user.email);
        return true;
      } else {
        return false;
      }
    }).toList();

    if (filteredUsers.isEmpty) {
      filteredUsers.add(User(-999, "查無資料", "查無資料", "查無資料",
          Address("查無資料", "查無資料", "查無資料", "查無資料",
              Geo("查無資料", "查無資料")), "查無資料", "查無資料",
          Company("查無資料", "查無資料", "查無資料")));
    }
  }

  @override
  Widget build(BuildContext context) {

    if (filteredUsers.isEmpty) {
      changeFilteredUsers("");
    }

    var searchTextEditingController = TextEditingController();

    // search bar
    Widget searchBar = TextField(
      controller: searchTextEditingController,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        hintText: "Enter a search term to search Email"
      ),
      onSubmitted: (inputStr) {
        setState(() {
          changeFilteredUsers(inputStr);
        });
      },
    );

    List<String> columnName = flatten(filteredUsers[0].toJson()).keys.toList();

    // Screen Width
    // final double width = MediaQuery.of(context).size.width;

    List<DataColumn> dataColumns = columnName.map((key) {
      return DataColumn(
          label: Container(
            // width: width * 0.065,
            child: Text(key, softWrap: true),
          )
      );
    }).toList();

    List<DataRow> dataRows = filteredUsers.map((user) {

      Map<String, dynamic> userJson = user.toJson();

      List<DataCell> dataCells = columnName.map((key) {
        return DataCell(
          Container(
            child: TextField(
              controller: TextEditingController(text: flatten(userJson)[key].toString()),
              onSubmitted: (inputStr) {
                // 將 userJson 該欄位的內容，換成用戶修改的內容
                userJson[key] = inputStr;
                print(userJson);

                var url = Uri.parse("https://jsonplaceholder.typicode.com/users");
                var response = http.post(url, body: jsonEncode(userJson));

                // 將遠端系統回傳的結果印出來
                response.then((value) => print(value.body));
              },
            ),
          )
        );
      }).toList();

      return DataRow(
          cells: dataCells
      );
    }).toList();

    return Container(
      child: Column(
        children: [
          Container(
              margin: const EdgeInsets.all(10),
              child: searchBar,
          ),
          Container(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columnSpacing: 10,
                  horizontalMargin: 10,
                  columns: dataColumns,
                  rows: dataRows,
                ),
              ),
            )
          ),
        ],
      ),
    );

  }

}