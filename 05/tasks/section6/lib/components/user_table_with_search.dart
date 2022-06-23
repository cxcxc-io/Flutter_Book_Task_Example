import 'package:flutter/material.dart';
import 'package:flat/flat.dart';
import '../models/user.dart';

class UserTableWithSearch extends StatefulWidget {

  List<User> users;

  UserTableWithSearch(this.users);

  @override
  State<StatefulWidget> createState() {
    return _UserTableWithSearch();
  }
}

class _UserTableWithSearch extends State<UserTableWithSearch> {

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
      return filteredUsers.add(User(-999, "查無資料", "查無資料", "查無資料",
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

    // ColumnName
    List<String> columnName = flatten(filteredUsers[0].toJson()).keys.toList();

    // Screen Width
    // final double width = MediaQuery.of(context).size.width;

    // DataColum
    List<DataColumn> dataColumns = columnName.map((key) {
      return DataColumn(
          label: Container(
            child: Text(key, softWrap: true),
          )
      );
    }).toList();

    List<DataRow> dataRows = filteredUsers.map((user) {

      List<DataCell> dataCells = columnName.map((key) {
        return DataCell(
            Container(
              child: Text(flatten(user.toJson())[key].toString(), softWrap: true),
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