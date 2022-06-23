import 'package:flutter/material.dart';
import '../components/user_text.dart';

class UserScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: UserText(),
    );
  }
}