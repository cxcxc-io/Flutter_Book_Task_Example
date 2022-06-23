// 為了讓 json string 與 Map 可以進行轉換，得引用此套件
import "dart:convert";
// 引入套件
import "package:http/http.dart" as http;

/// 帶有 async 的方法
///
/// 帶有 async 的方法，他的回傳值型態，仍然要加上一層 Future，void 除外
///
/// 此函數告知，未來會傳為一個 [List<dynamic>]，函數名為 [getRemoteSystemData]
/// 另外帶有一個參數叫做 [remoteUri]
Future<List<dynamic>> getRemoteSystemData(String remoteUri) async {
    // 生成 Uri 物件
    Uri multipleItemUrl = Uri.parse(remoteUri);

    // 使用 http 模組的 get 方法調度
    // 本應為 Future<http.Response>，透過 await，從 Future 取值後，型態宣告成 http.Response
    http.Response multipleResponses = await http.get(multipleItemUrl);

    // 轉換成可操作的 Dart List
    List<dynamic> jsonArrayFromRemote = jsonDecode(multipleResponses.body);

    // 將結果回傳
    return jsonArrayFromRemote;
}

/// 為使程式簡潔，我們引用了 async
void main() async {
    // 調度 getRemoteSystemData 函數，並等待其傳回的 Future 完成
    List<dynamic> jsonArrayResponse = await getRemoteSystemData('https://jsonplaceholder.typicode.com/users');

    // 調度 List 內的第一個 json object
    print(jsonArrayResponse[0]);
    // 調度該 json object 的 username 欄位
    print(jsonArrayResponse[0]['username']);
    print(jsonArrayResponse[0]['email']);

    // json object 並無此欄位，如何有效避免調度到不存在的欄位？
    print(jsonArrayResponse[0]['family']);

    // 調度 getRemoteSystemDataWithoutAsync 函數，並等待其傳回的 Future 完成
    List<dynamic> jsonArrayResponse2 = await getRemoteSystemDataWithoutAsync('https://jsonplaceholder.typicode.com/users');

    // 調度 List 內的第一個 json object
    print(jsonArrayResponse2[0]);
    // 調度該 json object 的 username 欄位
    print(jsonArrayResponse2[0]['username']);
    print(jsonArrayResponse2[0]['email']);

    // json object 並無此欄位，如何有效避免調度到不存在的欄位？
    print(jsonArrayResponse2[0]['family']);
}

/// 由於使用 Future 的內容，進行連續操作，他的回應值型態，必須要加上一層 Future，void 除外
/// 
/// 此函數不透過 async 進行資料擷取
/// 此函數告知，未來會傳回一個 [List<dynamic>]，函數名為 [getRemoteSystemDataWithoutAsync]
/// 另外帶有一個參數叫 [remoteUri]
Future<List<dynamic>> getRemoteSystemDataWithoutAsync(String remoteUri) {
    // 生成 Uri 物件
    Uri multipleItemUrl = Uri.parse(remoteUri);

    // 使用 http 模組的 get 方法調度
    // 資料型態為 Future<http.Response>
    Future<http.Response> multipleResponsesWithFuture = http.get(multipleItemUrl);

    // 轉換成可操作的 Dart List
    Future<List<dynamic>> jsonArrayFromRemoteWithFuture = multipleResponsesWithFuture.then((multipleResponses) {
        return jsonDecode(multipleResponses.body);
    });

    // 將結果回傳
    return jsonArrayFromRemoteWithFuture;
}
