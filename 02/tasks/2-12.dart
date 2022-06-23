import "dart:convert";
import "package:http/http.dart" as http;

/// 重新切割成多函數的方式，並搭配async/await，讓程式碼看起來更簡潔一些。
Future<List<dynamic>> getRemoteItems(String url) async {
    Uri remoteUrl = Uri.parse(url);

    // 取得資料
    http.Response itemsResponse = await http.get(remoteUrl);
    List<dynamic> multipleItems = jsonDecode(itemsResponse.body);

    // 回傳
    return multipleItems;
}

Future<Map<String, dynamic>> postItemToRemote(String url, String body) async {
    Uri remoteUrl = Uri.parse(url);

    // 取得資料
    http.Response postResponse = await http.post(remoteUrl, body: body);
    Map<String, dynamic> postResponseString = jsonDecode(postResponse.body);

    // 回傳
    return postResponseString;
}

void main() async {
    // 剖析 https://jsonplaceholder.typicode.com/posts，對其使用get方法，取回一系列json array，並取用第五個json object 。 對其使用post方法，取得json object，傳回其資料編號的id。
    var postsResponse =
        await getRemoteItems("https://jsonplaceholder.typicode.com/posts");
    // 取用第五個json object
    print(postsResponse[4]);
    String postString =
        """{"userId": 2, "id": 200, "title": "This is title", "body": "This is an article body"}""";
    var postPostResponse = await postItemToRemote(
        "https://jsonplaceholder.typicode.com/posts", postString);
    // 取得json object，傳回其資料編號的id
    print(postPostResponse);

    // 剖析 https://jsonplaceholder.typicode.com/comments，對其使用get方法，取回一系列json array，並取用第五個json object 。 對其使用post方法，取得json object，傳回其資料編號的id。
    var commentsResponse =
        await getRemoteItems("https://jsonplaceholder.typicode.com/comments");
    // 取用第五個json object
    print(commentsResponse[4]);
    String commentString =
        """{"postId": 3, "id": 300, "name": "The name is NAME", "email": "test@email.com", "body": "This is comment body"}""";
    var commentPostResponse = await postItemToRemote(
        "https://jsonplaceholder.typicode.com/comments", commentString);
    // 取得json object，傳回其資料編號的id
    print(commentPostResponse);

    // 剖析 https://jsonplaceholder.typicode.com/albums，對其使用get方法，取回一系列json array，並取用第五個json object 。 對其使用post方法，取得json object，傳回其資料編號的id。
    var albumsResponse =
        await getRemoteItems("https://jsonplaceholder.typicode.com/albums");
    // 取用第五個json object
    print(albumsResponse[4]);
    String albumString =
        """{"userId": 2, "id": 300, "title": "This is an album"}""";
    var albumPostResponse = await postItemToRemote(
        "https://jsonplaceholder.typicode.com/albums", albumString);
    // 取得json object，傳回其資料編號的id
    print(albumPostResponse);

    // 剖析 https://jsonplaceholder.typicode.com/todos，對其使用get方法，取回一系列json array，並取用第五個json object 。 對其使用post方法，取得json object，傳回其資料編號的id。
    var todosResponse =
        await getRemoteItems("https://jsonplaceholder.typicode.com/todos");
    // 取用第五個json object
    print(todosResponse[4]);
    String todoString =
        """{"userId": 1, "id": 300, "title": "This is a title", "completed": false}""";
    var todoPostResponse = await postItemToRemote(
        "https://jsonplaceholder.typicode.com/todos", todoString);
    // 取得json object，傳回其資料編號的id
    print(todoPostResponse);
}
