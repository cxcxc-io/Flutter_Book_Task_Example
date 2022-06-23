import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../models/post.dart';

class PostDao {

  // 插入，從本地緩存挑選，若無，則重新提取外部資料
  // 撰寫一個讀取資料的方法
  static Future<List<Post>> getPost() async {

    // 建立一個專們跟 Cache 溝通的客戶端物件
    SharedPreferences _prefs = await SharedPreferences.getInstance();

    // 設定 Cache 位置的索引
    String cacheKey = "posts";

    // 用可戶端物件，依照索引向緩存取的資料
    List<String>? postDataStringInCache = await _prefs.getStringList(cacheKey);

    if (postDataStringInCache != null) {
      print("從 Cache 載入資料");
      List<Post> posts = postDataStringInCache.map((postJsonString) => Post.fromJson(jsonDecode(postJsonString))).toList();
      return posts;
    } else {
      print("爬取資料");

      // 解析外部系統的格式
      var url = Uri.parse("https://jsonplaceholder.typicode.com/posts");
      // 透過 http 組件，使用 get 函數，向外部系統索取內容
      var response = await http.get(url);

      List<Post> posts = (jsonDecode(response.body) as List<dynamic>)
          .map((jsonObject) {return Post.fromJson(jsonObject);}).toList();

      // 將 Post 陣列轉換成 String 陣列，存一份回緩存內
      List<String> postsStringList = posts.map((e) => e.toJsonObjectString()).toList();
      _prefs.setStringList(cacheKey, postsStringList);

      // 將一系列 Post 物件傳回
      return posts;
    }


  }
}