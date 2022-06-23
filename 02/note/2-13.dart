/// User 類別
///
/// 用 User 類別案例，示範 class 的格式，class constuctor 語法格式， class method 的語法格式
class User {
    // 設定此類別的組成要件
    int id;
    String name;
    String username;
    String email;

    // 設定此類別的核心建構子
    // 特殊語法格式，意思就是用戶到時候按序輸入四個對應型別的參數，即可獲的一個 User 物件
    User(this.id, this.name, this.username, this.email);

    // 在人類世界裡，每個生物都會有他的技能，我們在這裡為 User 類別設計了一個函數，使用時，會告知大家，用戶的資訊
    void printUserInfo() {
        print("用戶叫做$name, 用戶的帳號為$username, 用戶的id是$id,  用戶的信箱為$email");
    }
}

/// 主程序
///
/// 嘗試生成一個 User 物件，並且取值，調度函數
/// 並註解了一個不存在 User 物件的變數，學員可自行取消註解，我們會發現 Dart 為該變數報錯，證名了先行驗證的益處。
void main() {
    // 生成用戶
    User demoUser = User(1, "李秉鴻", "lbh", "service@cxcxc.io");

    print(demoUser.id);
    print(demoUser.name);
    print(demoUser.username);
    print(demoUser.email);
    demoUser.printUserInfo();

    // 此不會過 Dart 的先行驗證
    // print(demoUser.xx);

    // 生成第二個用戶
    User demoUser2 = User(2, "小菜", "xiao-tsai", "xiao-tsai@cxcxc.io");
    print(demoUser2.id);
    print(demoUser2.name);
    print(demoUser2.username);
    print(demoUser2.email);
    demoUser2.printUserInfo();
}
