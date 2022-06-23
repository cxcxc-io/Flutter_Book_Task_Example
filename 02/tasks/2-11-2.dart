import "dart:convert";
import "package:http/http.dart" as http;

/// http套件的get與post行為，其實會傳入一個Future內進行操作，重建立一個async函數，在裡面以http套件結合Future與await的方式，將https://jsonplaceholder.typicode.com/users/1 的 json資料爬取下來，並印出phone欄位的內容
void getUserJson() async {
    Uri userUrl = Uri.parse("https://jsonplaceholder.typicode.com/users/1");

    http.Response user = await Future.microtask(() {
        var response = http.get(userUrl);
        return response;
    });
    
    Map<String, dynamic> userMap = jsonDecode(user.body);
    print(userMap["phone"]);
    }

    void main() {
    print("request start ...");

    getUserJson();

    print("END");
}
