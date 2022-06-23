import "dart:convert";

void main() {

    /// json array 轉 List 操作
    ///
    /// json array 裡面是裝載元素時，
    /// 先透過 jsonDecode 進行解析
    /// 迴圈調度時，宣告元素的型別，而後進行操作
    /// 添加元素進入
    /// 轉譯回 json array string
    // json array 字串
    String jsonArrayOfString = """[1, 2, 3, 4, 5]""";
    // 解析成操作的 List
    List<dynamic> jsonArray = jsonDecode(jsonArrayOfString);
    // 以 List 可接受的迴圈方式，並宣告 List 內的元素型別，操作資料
    for (int element in jsonArray) {
        print(element);
    }
    // 添加資料
    jsonArray.add(7);
    // 轉譯成 json string
    String jsonArrayToString = jsonEncode(jsonArray);
    // 印出
    print(jsonArray);
    print(jsonArrayToString);

    /// 解析 json array 裡的 json object
    /// 
    /// json array 裡面裝載大量 json object
    /// 解析成可操作的 List 格式
    /// 調度其中一個 json object
    /// 以迴圈方式調度
    /// 追加一個 json objetc
    /// 轉譯成可傳到外面的 json string
    // 一個裡面填充 json object 的 json array string
    String jsonArrayOfJsonObjectString = """[{"name": "雲育鏈", "age": 18}, {"name": "小菜", "age": 25}, {"name": "小美", "age": 21}]""";
    // 轉譯成可操作的 List
    List<dynamic> jsonArrayOfJsonObject = jsonDecode(jsonArrayOfJsonObjectString);
    
    // 調度List內其中一個 json object，提取 name 欄位
    print(jsonArrayOfJsonObject[0]['name']);

    // 以迴圈方式操作 List，提取時，宣告 jsonObject 的型態為 Map，而後進行操作
    for (Map<String, dynamic> jsonObject in jsonArrayOfJsonObject) {
        print(jsonObject);
    }

    // 添加一個 Map<String, dynamic> 進入該 List
    jsonArrayOfJsonObject.add({"name": "Flutter 課程", "age": 1});

    // 轉譯回 json string
    String jsonArrayOfObjectToString = jsonEncode(jsonArrayOfJsonObject);

    // 印出
    print(jsonArrayOfObjectToString);

}
