import 'package:flutter/material.dart';
import '../components/post_text.dart';

class PostScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PostText(),
    );
  }
}