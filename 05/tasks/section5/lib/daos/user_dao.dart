import 'dart:convert';

import 'package:http/http.dart' as http;
import '../models/user.dart';

class UserDao {

  static Future<List<User>> getUserData() async {

    var url = Uri.parse("https://jsonplaceholder.typicode.com/users");

    var response = await http.get(url);

    List<User> userData = (jsonDecode(response.body) as List<dynamic>)
        .map((userObject) {
          var user = User.fromJson(jsonDecode(jsonEncode(userObject)));
          return user;
        }).toList();

    return userData;
  }
}