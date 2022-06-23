import 'dart:math';
import 'package:flutter/material.dart';
import '../components/common_drawer.dart';
import '../daos/usage_analysis_data_dao.dart';

class StateChangeDemoScreen extends StatefulWidget {

  int red = 96;
  int green = 125;
  int blue = 139;
  double round = 0.0;

  bool firstButtonClicked = false;
  bool secondButtonClicked = false;

  @override
  State createState() {
    return _StateChangeDemoScreenState();
  }
}

class _StateChangeDemoScreenState extends State<StateChangeDemoScreen> {

  @override
  Widget build(BuildContext context) {

    Random random = new Random();
    print(this.widget.firstButtonClicked);
    print(this.widget.secondButtonClicked);

    Widget demoContainer;
    if (this.widget.firstButtonClicked == true &&
        this.widget.secondButtonClicked == false) {
      this.widget.red = random.nextInt(255);
      this.widget.green = random.nextInt(255);
      this.widget.blue = random.nextInt(255);
      demoContainer = Container(
        width: 300,
        height: 300,
        decoration: BoxDecoration(
            color: Color.fromARGB(
                255, this.widget.red, this.widget.green, this.widget.blue
            ),
            borderRadius: BorderRadius.all(Radius.circular(this.widget.round))
        ),
      );
    }
    else if (this.widget.firstButtonClicked == false &&
        this.widget.secondButtonClicked == true) {
      this.widget.round = random.nextInt(150).toDouble();
      demoContainer = Container(
        width: 300,
        height: 300,
        decoration: BoxDecoration(
            color: Color.fromARGB(
                255, this.widget.red, this.widget.green, this.widget.blue
            ),
            borderRadius: BorderRadius.all(Radius.circular(this.widget.round))
        ),
      );
    }
    else {
      demoContainer = Container(
        width: 300,
        height: 300,
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 96, 125, 139),
            borderRadius: BorderRadius.all(Radius.circular(0.0))
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(),
      drawer: CommonDrawer.getDrawer(context),
      body: Container(
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            Container(
              child: TextButton(
                onPressed: () {
                  setState(() {
                    this.widget.firstButtonClicked = true;
                    this.widget.secondButtonClicked = false;
                  });
                },
                child: Text("點擊換顏色"),
              ),
            ),
            Container(
              child: TextButton(
                onPressed: () {
                  setState(() {
                    this.widget.firstButtonClicked = false;
                    this.widget.secondButtonClicked = true;
                  });
                },
                child: Text("點擊換形狀"),
              ),
            ),
            Container(
              child: TextButton(
                onPressed: () {
                  setState(() {
                    this.widget.firstButtonClicked = false;
                    this.widget.secondButtonClicked = false;
                  });
                },
                child: Text("點擊回原樣"),
              ),
            ),
            demoContainer,
          ],
        ),
      ),
    );
  }
}