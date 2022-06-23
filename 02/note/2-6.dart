// 為了讓 json string 與 Map 可以進行轉換，得引用此套件
import "dart:convert";

void main() {

    /// 內容多型別的 Map 宣告方式
    ///
    /// 透過 dynamic 這個動態型別來囊括多種型別的定義
    /// 偵測鍵值的型別時，發現各鍵值的型別可以不同。
    Map<String, dynamic> dynamicMap = {
        "name": "xiao-mei",
        "age": 18
    };
    print(dynamicMap["name"].runtimeType);
    print(dynamicMap["age"].runtimeType);

    /// json object 轉 Map
    ///
    /// 將符合 json object 格式的字串，透過 convert 套件的 jsonDecode 方法轉成 Map<Stirng, dynamic>
    /// 而後可進行 Map 的相關資料操作
    String jsonObjectString = """{"name": "小明", "age": 28}""";
    Map<String, dynamic> fromJsonObjectStrToDartMap = jsonDecode(jsonObjectString);
    print(fromJsonObjectStrToDartMap["name"]);
    print(fromJsonObjectStrToDartMap["age"]);

    /// Map 轉 json object
    ///
    /// 為 Map 追加內容後，再透過 convert套件的 jsonEncode 方法轉化為符合 json 格式的字串
    fromJsonObjectStrToDartMap["sex"] = "male";
    String fromDartMapToJsonObjectString = jsonEncode(fromJsonObjectStrToDartMap);
    print(fromDartMapToJsonObjectString);
    print(fromDartMapToJsonObjectString.runtimeType);
    
}
