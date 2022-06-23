import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GetRemoteDataScreen extends StatelessWidget{

  Future<dynamic> getRemoteData() async {
    var url = Uri.parse("https://jsonplaceholder.typicode.com/users");
    var response = await http.get(url);
    return response.body;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getRemoteData(),
        initialData: [],
        builder: (BuildContext context, AsyncSnapshot<dynamic> asyncSnapshot) {
          // print(asyncSnapshot.data);
          return Scaffold(
            body: Text(asyncSnapshot.data.toString()),
          );
        }
    );
  }
}