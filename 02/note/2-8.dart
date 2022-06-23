// 轉換 json 和 Map 需要使用的套件
import "dart:convert";
// 引入套件
import "package:http/http.dart" as http;

void main() async {

    /// 使用 http 套件，拿取外部資料
    ///
    /// 將遠端網址，轉換成一個 Uri 型別的物件
    /// 並將此物件，置入 Dart 程式語言的 http 套件提供的 get 方法
    /// 而後將回傳的內容印出來
    /// 並將該 response 的 body 轉譯成 json，並嘗試調度裡面的 phone 欄位
    // 生成 Uri 物件
    Uri url = Uri.parse('https://jsonplaceholder.typicode.com/users/1');
    // 使用 http 套件的 get 方法調度外部資料
    var response = await http.get(url);
    // 印出回應結果，確認回傳的 json 資料長相
    print(response.body);
    // 轉換成可操作的 Dart Map
    Map<String, dynamic> jsonObjectFromRemote = jsonDecode(response.body);
    // 調度裡面的欄位
    print(jsonObjectFromRemote['phone']);

    /// 取得遠端 json array 資料~
    ///
    /// 已知道遠端網址，會傳回一個 json array
    /// 將遠端網址轉換成 Uri 物件
    /// 並將此物件，置入 Dart 程式語言的 http 套件提供的 get 方法
    /// 印出回應內容
    /// 轉換成 List
    /// 調度 List 內的 json object
    // 生成 Uri 物件
    Uri multipleItemUrl = Uri.parse('https://jsonplaceholder.typicode.com/users');
    // 使用 http 套件的 get 方法調度
    var multipleResponses = await http.get(multipleItemUrl);
    // 印出回應結果，確認回傳的 json 資料長相
    print(multipleResponses.body);
    // 轉換成可操作的 Dart List
    List<dynamic> jsonArrayFromRemote = jsonDecode(multipleResponses.body);
    // 調度裡面的元素
    print(jsonArrayFromRemote[0]);

    /// 拋資料給遠端系統
    /// 
    /// 已知道遠端系統網址，拋資料給遠端系統
    /// 將遠端網址轉化成 Uri 物件
    /// 並將此物件，置入 Dart 程式語言的 http 套件提供的 post 方法，置入時，順道將要傳送的資料內容，放到 body 內
    /// 印出傳送後的結果
    // 生成 Uri 物件
    Uri postItemUrl = Uri.parse("https://jsonplaceholder.typicode.com/posts");
    // 使用 http 套件的 post 方法調度，並順道傳入資料內容
    String postRequestJsonBody = jsonEncode({"userId": "99","title": '雲育鏈', "body": '半夜寫程式，累啊。'});
    var postResponse = await http.post(postItemUrl, body: postRequestJsonBody);
    print(postResponse.body);

}
