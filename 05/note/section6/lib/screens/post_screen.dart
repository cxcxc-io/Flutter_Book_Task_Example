import 'package:flutter/material.dart';
import '../components/post_table_with_search.dart';
import '../daos/post_dao.dart';
import '../models/post.dart';

class PostScreen extends StatefulWidget {

  @override
  State createState() {
    return _PostScreen();
  }
}

class _PostScreen extends State<PostScreen> {

  // 透過 PostData 取用遠端系統資料，此資料會返還 Future
  // 故使用 FutureBuilder，當資料取回時，可以進行畫面重渲染。
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        // 讀取遠端資料
        future: PostDao.getPost(),
        // 設計取用遠端資料後的操作方法
        builder: (BuildContext context, AsyncSnapshot<List<Post>> asyncOfPosts) {

          /// TODO: sdk: ">=2.16.1 <3.0.0" 的版本，會報錯
          return Scaffold(
            body: PostTableWithSearch(asyncOfPosts.requireData),
          );

          /// TODO: sdk: ">=2.16.1 <3.0.0" 的版本，可正常
          // if (asyncOfPosts.connectionState == ConnectionState.done) {
          //   return Scaffold(
          //     // 將載入的資料當作 PostTable 的建構子，創建一個 PostTable 物件
          //       body: PostTableWithSearch(asyncOfPosts.requireData)
          //   );
          // } else {
          //   return Container();
          // }
        }
    );
  }
}