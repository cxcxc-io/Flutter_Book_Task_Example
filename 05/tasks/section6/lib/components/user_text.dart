import 'dart:convert';

import 'package:flutter/material.dart';
import '../daos/user_dao.dart';
import '../models/user.dart';

class UserText extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
        future: UserDao.getUserData(),
        builder: (BuildContext context, AsyncSnapshot<List<User>> asyncSnapshot) {

          List<Widget> widgets = [];

          print(asyncSnapshot.connectionState);
          print(asyncSnapshot.hasData);

          if (asyncSnapshot.connectionState == ConnectionState.done) {
            widgets = asyncSnapshot.requireData.map((user) {
              // print(jsonEncode(user.toJson()));
              return Text(jsonEncode(user.toJson()));
            }).toList();
          }

          return SingleChildScrollView(
            child: Column(
              children: widgets,
            ),
          );
        }
    );
  }
}