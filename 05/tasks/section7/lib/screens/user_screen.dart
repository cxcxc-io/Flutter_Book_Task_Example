import 'package:flutter/material.dart';
import '../components/user_table_with_search_and_edit.dart';
import '../daos/user_dao.dart';
import '../models/user.dart';

class UserScreen extends StatefulWidget {

  @override
  State createState() {
    return _UserScreen();
  }
}

class _UserScreen extends State<UserScreen> {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: UserDao.getUserData(),
      builder: (BuildContext context, AsyncSnapshot<List<User>> asyncOfUsers) {

        if (asyncOfUsers.connectionState == ConnectionState.done) {
          return Scaffold(
            body: UserTableWithSearchEdit(asyncOfUsers.requireData)
          );
        } else {
          return Container();
        }

      },
    );
  }
}