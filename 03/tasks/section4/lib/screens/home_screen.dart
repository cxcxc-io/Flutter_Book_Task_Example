import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      /// 第一階段
      // body: Row(
      //   children: [
      //     Container(
      //       color: Color(0xFF607D8B),
      //       child: Text(
      //         "這邊要放一張圖片",
      //         style: TextStyle(fontSize: 28),
      //       ),
      //     ),
      //     Container(
      //       color: Color(0xFFD6B0A7),
      //       child: Text(
      //         "這邊來一段正文",
      //         style: TextStyle(fontSize: 28),
      //       ),
      //     ),
      //     Container(
      //       color: Color(0xFFCBCBCB),
      //       child: Text(
      //         "這邊是其他列表",
      //         style: TextStyle(fontSize: 28),
      //       ),
      //     )
      //   ],
      // ),

      /// 第二階段
      // body: Row(
      //   children: [
      //     Expanded(
      //       child: Container(
      //         width: 300,
      //         height: 300,
      //         color: Color(0xFF607D8B),
      //         child: Text(
      //           "這邊要放一張圖片",
      //           style: TextStyle(fontSize: 28),
      //         ),
      //       )
      //     ),
      //     Expanded(
      //       child: Container(
      //         width: 800,
      //         height: 800,
      //         color: Color(0xFFD6B0A7),
      //         child: Text(
      //           "這邊來一段正文",
      //           style: TextStyle(fontSize: 28),
      //         ),
      //       )
      //     ),
      //     Expanded(
      //       child: Container(
      //         width: 300,
      //         height: 300,
      //         color: Color(0xFFCBCBCB),
      //         child: Text(
      //           "這邊是其他列表",
      //           style: TextStyle(fontSize: 28),
      //         ),
      //       )
      //     )
      //   ],
      // ),

      /// 第三階段
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Container(
              width: 300,
              height: 300,
              color: Color(0xFF607D8B),
              child: Text(
                "這邊要放一張圖片",
                style: TextStyle(fontSize: 28),
              ),
            ),
            Container(
              width: 800,
              height: 800,
              color: Color(0xFFD6B0A7),
              child: Text(
                "這邊來一段正文",
                style: TextStyle(fontSize: 28),
              ),
            ),
            Container(
              width: 300,
              height: 300,
              color: Color(0xFFCBCBCB),
              child: Text(
                "這邊是其他列表",
                style: TextStyle(fontSize: 28),
              ),
            )
          ],
        ),
      ),
    );
  }
}