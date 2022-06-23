import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../models/user.dart';

class UserDao {

  static Future<List<User>> getUserData() async {

    SharedPreferences _prefs = await SharedPreferences.getInstance();

    String cacheKey = "users";

    List<String>? postDataStringInCache = await _prefs.getStringList(cacheKey);

    if (postDataStringInCache != null) {

      print("向 Cache 拿資料");

      List<User> users = postDataStringInCache.map((userString) => User.fromJson(jsonDecode(userString))).toList();
      return users;

    } else {

      print("向 遠端 拿資料");

      var url = Uri.parse("https://jsonplaceholder.typicode.com/users");

      var response = await http.get(url);

      List<User> userData = (jsonDecode(response.body) as List<dynamic>)
          .map((userObject) {
        var user = User.fromJson(jsonDecode(jsonEncode(userObject)));
        return user;
      }).toList();

      List<String> userCachedString = userData.map((user) => jsonEncode(user.toJson())).toList();
      _prefs.setStringList(cacheKey, userCachedString);

      return userData;
    }


  }
}