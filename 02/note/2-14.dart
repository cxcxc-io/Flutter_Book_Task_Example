import "dart:convert";

/// User 類別
///
/// 用 [User] 類別案例，示範 class 的格式，class constructor 語法格式，class method 的語法格式
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
        dynamic instanceMap = {"id": id, "name": name, "username": username, "email": email};
        return jsonEncode(instanceMap);
    }
}

/// 主程序
void main() {
    // 以基本元素去生成用戶
    User demoUser = User(1, "李秉鴻", "lbh", "service@cxcxc.io");

    print(demoUser.id);
    print(demoUser.name);
    print(demoUser.username);
    print(demoUser.email);
    demoUser.printUserInfo();
    print(demoUser.toJson());

    print("== == == == == 以準備好的 json string 去生成用戶物件 == == == == ==");
    // 準備一個 json String
    String userJsonString = """{"id": 2, "name": "小美", "username": "xiaomei", "email": "cloud-master@cxcxc.io"}""";
    // 轉換成 Dart 可操作的 dynamic json 資料型態
    dynamic userJsonStringToDartDynamic = jsonDecode(userJsonString);
    // 轉換成 User 物件
    User demoUser2 = User.fromJson(userJsonStringToDartDynamic);
    print(demoUser2.id);
    print(demoUser2.name);
    print(demoUser2.username);
    print(demoUser2.email);
    demoUser2.printUserInfo();
    print(demoUser2.toJson());  

    print("== == == == == 將 User 物件轉換成 json，並用此 json 去生成 User 物件");
    // 將原本的 user 物件轉換成符合 json 格式的 String
    String userObjectTojsonString = demoUser.toJson();
    // 再將此 String，轉換為可操作的 dynamic json 資料型態
    dynamic jsonStringToDartJson = jsonDecode(userObjectTojsonString);
    // 轉換成 User 物件
    User demoUser3 = User.fromJson(jsonStringToDartJson)
    print(demoUser3.id);
    print(demoUser3.name);
    print(demoUser3.username);
    print(demoUser3.email);
    demoUser3.printUserInfo();
    print(demoUser3.toJson());  
}
