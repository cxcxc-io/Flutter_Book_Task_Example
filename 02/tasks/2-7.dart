import "dart:convert";

void main() {
    // 有一個複雜巢狀 json string，嘗試解析並提出arrayInJsonObject的內容值
    String validNestedJsonObjectString = """{"jsonString": "hello", "jsonNumber": 123, "jsonArray": [1, 2, 3, 4, 5, 6], "jsonObject": {"stringInJsonObject": "abc", "numberInJsonObject": 456, "arrayInJsonObject": [7, 8, 9, 1, 2, 3], "objectInJsonObject": {"lastStringField": "cxcxc"}}}""";

    Map<String, dynamic> stringToMap = jsonDecode(validNestedJsonObjectString);
    String jsonObjectString = jsonEncode(stringToMap['jsonObject']);
    Map<String, dynamic> jsonObject = jsonDecode(jsonObjectString);
    List<dynamic> arrayInJsonObject = jsonObject['arrayInJsonObject'];
    print(arrayInJsonObject);
}
