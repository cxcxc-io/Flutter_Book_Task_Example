import "dart:convert";
import "package:http/http.dart" as http;

void main() {
    // http套件的get與post行為，其實會傳入一個Future內進行操作，以http套件結合Future與then的方式，將https://jsonplaceholder.typicode.com/users/1的json資料爬取下來，並印出phone欄位的內容
    Uri userUrl = Uri.parse("https://jsonplaceholder.typicode.com/users/1");
    Future.microtask(() {
        var response = http.get(userUrl);
        return response;
    }).then((userData) {
        Map<String, dynamic> userJson = jsonDecode(userData.body);
        print(userJson["phone"]);
    });
}
