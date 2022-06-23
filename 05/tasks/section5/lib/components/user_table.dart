import 'package:flutter/material.dart';
import 'package:flat/flat.dart';
import '../models/user.dart';

class UserTable extends StatelessWidget {

  List<User> users;

  UserTable(this.users);

  @override
  Widget build(BuildContext context) {

    // columnName
    List<String> columnName = flatten(users[0].toJson()).keys.toList();

    print(columnName);

    // DataColumn
    List<DataColumn> dataColumns = columnName.map((key) {
      return DataColumn(
        label: Container(
          child: Text(key, softWrap: true),
        )
      );
    }).toList();

    // DataRow
    List<DataRow> dataRows = users.map((user) {

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
    );
  }
}
