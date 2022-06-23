import 'dart:convert';

/// 資料類別
///
/// 資料類別的重要性，在於其為建構資料系統的核心
/// 因此必須為其設計，如何有效轉換為外部數據，或從外部數據匯入的函數
class Post {

  // 由於該遠端系統的資料有該些欄位，故設定之
  int userId;
  int id;
  String title;
  String body;

  // 建構子
  Post(this.userId, this.id, this.title, this.body);

  // 可將物件轉換成符合 Json 規格的 String
  // 後續要傳數據給外部系統時，可透過此函數轉換成外部系統需要的 json 格式
  String toJsonObjectString() {
    return jsonEncode({
      "userId": this.userId,
      "id": this.id,
      "title": this.title,
      "body": this.body
    });
  }

  // 建構子的一種
  // 能將符合 json 規格的 dynamic 建置成 Post 物件
  // 因應未來跟外部系統取得數據後，轉換成 Post 物件
  factory Post.fromJson(dynamic jsonObject) {
    return Post(
      jsonObject['userId'],
      jsonObject['id'],
      jsonObject['title'],
      jsonObject['body'],
    );
  }
}