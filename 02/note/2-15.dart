import "dart:convert";

// 引入套件
import "package:http/http.dart" as http;

/// User 類別
///
/// 用 [User] 類別案例，示範 class 的格式，class construct 語法格式，class method 的語法格式
class User {
    // 設定此類別的組成要件
    int id;
    String name;
    String username;
    String email;

    // 設定此類別的核心建構子
    // 特殊語法格式，意思就是用戶到時候按序輸入四個對應型別的參數，即可獲得一個 User 物件
    User(this.id, this.name, this.username, this.email);

    // 在人類世界裡，每個生物都會有他的技能，我們在這裡為 User 類別設計了一個函數，使用時，會告知大家，用戶的資訊
    void printUserInfo() {
        print("用戶叫做$name, 用戶的帳號為$username, 用戶的id是$id, 用戶的信箱為$email");
    }

    /// fatory 多重建構子
    ///
    /// 類別的專屬方法，不需先生成物件，再由物件觸發。直接以類別就可以調度的方法，但須回傳該類別的物件
    /// 語法：
    /// fatory 類別名.方法名(參數型別 參數名) { 方法邏輯，必須回傳該類別的物件 }
    ///
    /// 此方法為輸入一個 json objectc 後，
    /// 從該 object 內提取出 id 欄位
    /// 從該 object 內提取出 name 欄位
    /// 從該 object 內提取出 username 欄位
    /// 從該 object 內提取出 email 欄位
    /// 組合成 User 物件
    factory User.fromJson(dynamic userJson) {
        int extractUserId = userJson["id"];
        String extractName = userJson["name"];
        String extractUserName = userJson["username"];
        String email = userJson["email"];
        return User(extractUserId, extractName, extractUserName, email);
    }

    /// 增設一個 toJson 方法，可由物件轉換成可傳給外部系統的 json
    ///
    /// 此處為設定一個型別為 Map<String, dynamic> 的內容，
    /// 並交由 jsonEncode 方法轉換成 String，而後回傳
    String toJson() {
        dynamic instanceMap = {
        "id": id,
        "name": name,
        "username": username,
        "email": email
        };
        return jsonEncode(instanceMap);
    }
}

/// 帶有 async 的方法，他的回傳值型態，仍然要加上一層 Future，void 除外
/// 此函數告知，未來會傳回一個 [List<User>]，函數名為 [getRemoteSystemUserData]
Future<List<User>> getRemoteSystemUserData() async {
    // 生成 Uri 物件
    Uri multipleItemUrl = Uri.parse("https://jsonplaceholder.typicode.com/users");

    // 使用 http 模組的 get 方法調度
    // 本應為 Future<http.Response>，透過 await，從 Future 取值後，型態宣告成 http.Response
    http.Response remoteSystemResponses = await http.get(multipleItemUrl);

    // 轉換成可操作的 Dart List
    List<dynamic> jsonArrayFromRemote = jsonDecode(remoteSystemResponses.body);

    // 將遠端傳回的 dynamic json 都轉成 User 物件
    List<User> userArray = jsonArrayFromRemote
        .map((dynamicUserJson) => User.fromJson(dynamicUserJson))
        .toList();

    // 將結果回傳
    return userArray;
}

/// 主程序
void main() async {
    // 調度函數，向遠端取得一系列 User 物件
    List<User> userArray = await getRemoteSystemUserData();

    // 嘗試調閱其中一個，並轉換成 String, 而後印出
    print(userArray[0].toJson());

    print("====== 用戶數據 ======");
    // 生成 Uri 物件
    Uri remoteSystemUrl = Uri.parse("https://jsonplaceholder.typicode.com/users");
    // 將 User 物件轉換成 json 之後，傳回遠端系統
    // 本應為 Future<http.Response>，透過 await，從 Future 取值後，型態宣告成 http.Response
    String postData = userArray[0].toJson();
    http.Response postResponses =
        await http.post(remoteSystemUrl, body: postData);
    // 將傳回結果印出
    print(postResponses.body);
}
