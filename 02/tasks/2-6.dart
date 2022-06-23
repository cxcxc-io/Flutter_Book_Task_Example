import "dart:convert";

void main() {

    /// 宣告一個 Map
    ///
    /// 鍵值型態分別為 String, dynamic。 
    /// 有一個鍵叫做 questionId，內容為整數。
    /// 有一個鍵叫做 questionContent，內容為字串。
    Map<String, dynamic> thisIsADynamicMap = {
        "questionId": 1,
        "questionContent": "第一個問題"
    };

    /// 將先前建置的Map 轉換成 json object格式的字串 
    String jsonConvertFromMap = jsonEncode(thisIsADynamicMap);
    print(jsonConvertFromMap);

    /// 有一個符合json object格式的字串，請嘗試轉換成Map<String, dynamic>的資料結構，並成功提取itemId欄位。
    String itemString = """{
        "itemId": 303031,
        "itemName": "白米飯",
        "itemPrice": 300
    }""";
    Map<String, dynamic> mapFromJsonObject = jsonDecode(itemString);
    print(mapFromJsonObject["itemId"]);

    /// 有一個複雜巢狀 json string，嘗試解析並提出stringInJsonObject的內容值
    String validNestedJsonObjectString = """{"jsonString":"hello","jsonNumber": 123,"jsonArray": [1,2,3,4,5,6],"jsonObject":{"stringInJsonObject":"abc","numberInJsonObject":456,"arrayInJsonObject":[7,8,9,1,2,3],"objectInJsonObject":{"lastStringField":"cxcxc"}}}""";
    Map<String, dynamic> nestedJsonObject = jsonDecode(validNestedJsonObjectString);
    String nestedJsonObjectToString = jsonEncode(nestedJsonObject["jsonObject"]);
    Map<String, dynamic> jsonObjectInnestedJsonObject = jsonDecode(nestedJsonObjectToString);
    print(jsonObjectInnestedJsonObject["stringInJsonObject"]);

}
