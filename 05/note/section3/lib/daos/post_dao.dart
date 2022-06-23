import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/post.dart';

class PostDao {
  // 插入，從本地緩存挑選，若無，則重新提取外部資料
  // 撰寫一個讀取資料的方法
  static Future<List<Post>> getPost() async {
    // 解析外部系統的格式
    var url = Uri.parse("https://jsonplaceholder.typicode.com/posts");
    // 透過 http 組件，使用 get 函數，向外部系統索取內容
    var response = await http.get(url);

    List<Post> posts = (jsonDecode(response.body) as List<dynamic>)
        .map((jsonObject) {return Post.fromJson(jsonObject);}).toList();
    // 將一系列 Post 物件傳回
    return posts;
  }
}