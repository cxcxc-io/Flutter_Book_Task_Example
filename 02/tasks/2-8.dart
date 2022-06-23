import "dart:convert";
import "package:http/http.dart" as http;

void main() async {

    // 剖析 https://jsonplaceholder.typicode.com/posts，對其使用get方法，取回一系列json array，並取用第五個json object 。 對其使用post方法，取得json object，上面傳回 資料編號的id
    Uri postsUrl = Uri.parse("https://jsonplaceholder.typicode.com/posts");
    var postsResponse = await http.get(postsUrl);
    // print(postsResponse.body);
    List<dynamic> postsList = jsonDecode(postsResponse.body);
    print(postsList[4]);
    String postString = """{"userId": 2, "id": 200, "title": "This is title", "body": "This is an article body"}""";
    var postPostResponse = await http.post(postsUrl, body: postString);
    print(postPostResponse.body);
    
    // 剖析 https://jsonplaceholder.typicode.com/comments，對其使用get方法，取回一系列json array，並取用第五個json object 。 對其使用post方法，取得json object，上面傳回 資料編號的id
    Uri commentsUrl = Uri.parse("https://jsonplaceholder.typicode.com/comments");
    var commentsResponse = await http.get(commentsUrl);
    // print(commentsResponse.body);
    List<dynamic> commentsList = jsonDecode(commentsResponse.body);
    print(commentsList[4]);
    String commentString = """{"postId": 3, "id": 300, "name": "The name is NAME", "email": "test@email.com", "body": "This is comment body"}""";
    var commentPostResponse = await http.post(commentsUrl, body: commentString);
    print(commentPostResponse.body);
    
    // 剖析 https://jsonplaceholder.typicode.com/albums，對其使用get方法，取回一系列json array，並取用第五個json object 。 對其使用post方法，取得json object，上面傳回 資料編號的id
    Uri albumsUrl = Uri.parse("https://jsonplaceholder.typicode.com/albums");
    var albumsResponse = await http.get(albumsUrl);
    List<dynamic> albumsList = jsonDecode(albumsResponse.body);
    print(albumsList[4]);
    String albumString = """{"userId": 2, "id": 300, "title": "This is an album"}""";
    var albumPostResponse = await http.post(albumsUrl, body: albumString);
    print(albumPostResponse.body);
    
    // 剖析 https://jsonplaceholder.typicode.com/todos，對其使用get方法，取回一系列json array，並取用第五個json object 。 對其使用post方法，取得json object，上面傳回 資料編號的id
    Uri todosUrl = Uri.parse("https://jsonplaceholder.typicode.com/todos");
    var todosResponse = await http.get(todosUrl);
    List<dynamic> todosList = jsonDecode(todosResponse.body);
    print(todosList[4]);
    String todoString = """{"userId": 1, "id": 300, "title": "This is a title", "completed": false}""";
    var todoPostResponse = await http.post(todosUrl, body: todoString);
    print(todoPostResponse.body);

}
