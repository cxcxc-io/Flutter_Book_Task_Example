import "dart:convert";
import "package:http/http.dart" as http;

/// 剖析 https://jsonplaceholder.typicode.com/posts，並定義Post類別，設計toJson與fromJson方法，從外部系統取回一系列json array時，能夠轉換成List<Post>，並取用第五個Post object 。 再將該Post object，轉換回json後，作為http的post方法內容送出。
class Post {
    // 屬性
    int userId;
    int id;
    String title;
    String body;

    // 建構子
    Post(this.userId, this.id, this.title, this.body);

    // 第二建構子
    factory Post.fromJson(dynamic postData) {
        int postUserId = postData["userId"];
        int postId = postData["id"];
        String postTitle = postData["title"];
        String postBody = postData["body"];
        return Post(postUserId, postId, postTitle, postBody);
    }

    // toJson() 的方法
    String toJson() {
        dynamic postMap = {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body
        };
        return jsonEncode(postMap);
    }
}

Future<List<Post>> getRemotePosts() async {
    Uri postUrl = Uri.parse("https://jsonplaceholder.typicode.com/posts");

    http.Response postsResponse = await http.get(postUrl);
    List<dynamic> postsResponseArray = jsonDecode(postsResponse.body);
    List<Post> postArray =
        postsResponseArray.map((post) => Post.fromJson(post)).toList();

    return postArray;
}

/// 剖析 https://jsonplaceholder.typicode.com/comments，並定義Comment類別，設計toJson與fromJson方法，從外部系統取回一系列json array時，能夠轉換成List<Comment>，並取用第五個Comment object 。 再將該Comment object，轉換回json後，作為http的post方法內容送出。
class Comment {
    // 屬性
    int postId;
    int id;
    String name;
    String email;
    String body;

    // 建構子
    Comment(this.postId, this.id, this.name, this.email, this.body);

    // 第二建構子
    factory Comment.fromJson(dynamic commentData) {
        int commentPostId = commentData["postId"];
        int commentId = commentData["id"];
        String commentName = commentData["name"];
        String commentEmail = commentData["email"];
        String commentBody = commentData["body"];
        return Comment(
            commentPostId, commentId, commentName, commentEmail, commentBody);
    }

    // toJson() 的方法
    String toJson() {
        dynamic commentMap = {
        "postId": postId,
        "id": id,
        "name": name,
        "email": email,
        "body": body
        };
        return jsonEncode(commentMap);
    }
}

Future<List<Comment>> getRemoteComments() async {
    Uri commentUrl = Uri.parse("https://jsonplaceholder.typicode.com/comments");

    http.Response commentsResponse = await http.get(commentUrl);
    List<dynamic> commentsResponseArray = jsonDecode(commentsResponse.body);
    List<Comment> commentArray = commentsResponseArray
        .map((comment) => Comment.fromJson(comment))
        .toList();

    return commentArray;
}

/// 剖析 https://jsonplaceholder.typicode.com/albums，並定義Album類別，設計toJson與fromJson方法，從外部系統取回一系列json array時，能夠轉換成List<Album>，並取用第五個Album object 。 再將該Album object，轉換回json後，作為http的post方法內容送出。
class Album {
    // 屬性
    int userId;
    int id;
    String title;

    // 建構子
    Album(this.userId, this.id, this.title);

    // 第二建構子
    factory Album.fromJson(dynamic albumData) {
        int albumUserId = albumData["userId"];
        int albumId = albumData["id"];
        String albumTitle = albumData["title"];
        return Album(albumUserId, albumId, albumTitle);
    }

    // toJson() 的方法
    String toJson() {
        dynamic albumMap = {"userId": userId, "id": id, "name": title};
        return jsonEncode(albumMap);
    }
}

Future<List<Album>> getRemoteAlbums() async {
    Uri albumUrl = Uri.parse("https://jsonplaceholder.typicode.com/albums");

    http.Response albumsResponse = await http.get(albumUrl);
    List<dynamic> albumsResponseArray = jsonDecode(albumsResponse.body);
    List<Album> albumArray =
        albumsResponseArray.map((album) => Album.fromJson(album)).toList();

    return albumArray;
}

/// 剖析 https://jsonplaceholder.typicode.com/todos，並定義Todo類別，設計toJson與fromJson方法，從外部系統取回一系列json array時，能夠轉換成List<Todo>，並取用第五個Todo object 。 再將該Todo object，轉換回json後，作為http的post方法內容送出。
class Todo {
    // 屬性
    int userId;
    int id;
    String title;
    bool completed;

    // 建構子
    Todo(this.userId, this.id, this.title, this.completed);

    // 第二建構子
    factory Todo.fromJson(dynamic todoData) {
        int todoUserId = todoData["userId"];
        int todoId = todoData["id"];
        String todoTitle = todoData["title"];
        bool todoCompleted = todoData["completed"];
        return Todo(todoUserId, todoId, todoTitle, todoCompleted);
    }

    // toJson() 的方法
    String toJson() {
        dynamic todoMap = {
        "userId": userId,
        "id": id,
        "name": title,
        "completed": completed
        };
        return jsonEncode(todoMap);
    }
}

Future<List<Todo>> getRemoteTodos() async {
    Uri todoUrl = Uri.parse("https://jsonplaceholder.typicode.com/todos");

    http.Response todosResponse = await http.get(todoUrl);
    List<dynamic> todosResponseArray = jsonDecode(todosResponse.body);
    List<Todo> todoArray =
        todosResponseArray.map((todo) => Todo.fromJson(todo)).toList();

    return todoArray;
}

void main() async {
    // post
    print("=== GET post ===");
    List<Post> postArray = await getRemotePosts();
    print(postArray[4].toJson());

    print("=== POST post ===");
    Uri postUrl = Uri.parse("https://jsonplaceholder.typicode.com/posts");
    String postData = postArray[4].toJson();

    http.Response postPostResponse = await http.post(postUrl, body: postData);
    print(jsonDecode(postPostResponse.body));

    // comment
    print("=== GET comment ===");
    List<Comment> commentArray = await getRemoteComments();
    print(commentArray[4].toJson());

    print("=== POST comment ===");
    Uri commentUrl = Uri.parse("https://jsonplaceholder.typicode.com/comments");
    String commentData = commentArray[4].toJson();

    http.Response commentPostResponse =
        await http.post(commentUrl, body: commentData);
    print(jsonDecode(commentPostResponse.body));

    // album
    print("=== GET album ===");
    List<Album> albumArray = await getRemoteAlbums();
    print(albumArray[4].toJson());

    print("=== POST album ===");
    Uri albumUrl = Uri.parse("https://jsonplaceholder.typicode.com/albums");
    String albumData = commentArray[4].toJson();

    http.Response albumPostResponse = await http.post(albumUrl, body: albumData);
    print(jsonDecode(albumPostResponse.body));

    // todo
    print("=== GET todo ===");
    List<Todo> todoArray = await getRemoteTodos();
    print(todoArray[4].toJson());

    print("=== POST todo ===");
    Uri todoUrl = Uri.parse("https://jsonplaceholder.typicode.com/todos");
    String todoData = commentArray[4].toJson();

    http.Response todoPostResponse = await http.post(todoUrl, body: todoData);
    print(jsonDecode(todoPostResponse.body));
}
