import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:section4/daos/usage_analysis_data_dao.dart';
import 'package:section4/models/usage_analysis_data.dart';
import '../components/common_drawer.dart';

class Calculator extends StatefulWidget {

  bool startAgain = true;
  double totalValue = 0;
  double secondValue = 0;
  int pressAction = -1;
  String hintText = '0';

  @override
  State createState() {
    return _Calculator();
  }
}

class _Calculator extends State<Calculator> {

  @override
  Widget build(BuildContext context) {

    var textEditingController = TextEditingController();

    // 文字輸入框
    Widget userInputTextField = Container(
      decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.all(Radius.circular(5.0))
      ),
      margin: EdgeInsets.only(left: 10, right: 10),
      width: 400,
      child: TextField(
        style: TextStyle(
          fontSize: 32.0,
          height: 1.5,
        ),
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: this.widget.hintText,
          // hintTextDirection:TextDirection.rtl,
        ),
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        textAlign: TextAlign.right,
        controller: textEditingController,
        onChanged: (inputValue) {
          this.widget.totalValue = double.parse(inputValue);
        },
      ),
    );

    return Scaffold(
        appBar: AppBar(),
        drawer: CommonDrawer.getDrawer(context),
        body: Container(
          alignment: Alignment.topCenter,
          margin: EdgeInsets.only(top: 10),
          child: Container(
            color: Colors.black87,
            width: 400,
            height: 600,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                userInputTextField,
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Color(0xFFCBCBCB),
                            shape: BoxShape.circle
                        ),
                        child: TextButton(
                          child: Text("AC" ,style: TextStyle(fontSize: 32.0, color: Colors.black)),
                          onPressed: () {
                            // 觸發 setState() {}，Flutter 會重新執行 build 函數，
                            // 重新進行頁面渲染
                            setState(() {
                              // 變更原來 Widget 的屬性
                              this.widget.totalValue = 0;
                              this.widget.secondValue = 0;
                              this.widget.hintText = '0';
                              this.widget.pressAction = -1;
                              this.widget.startAgain = true;
                              print("用戶點擊 AC");
                              print(this.widget.pressAction);
                              print(this.widget.hintText);
                              print(this.widget.startAgain);
                              print(this.widget.totalValue);
                              print(this.widget.secondValue);
                            });
                          },
                        ),
                      ),
                      Container(
                        width: 80,
                        height: 80,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Color(0xFFCBCBCB),
                            shape: BoxShape.circle
                        ),
                        child: TextButton(
                          child: Text("+/-" ,style: TextStyle(fontSize: 32.0, color: Colors.black)),
                          onPressed: () {
                            // 觸發 setState() {}，Flutter 會重新執行 build 函數，
                            // 重新進行頁面渲染
                            setState(() {
                              // 變更原來 Widget 的屬性
                              if (this.widget.startAgain == true) {
                                this.widget.totalValue *= -1 ;
                                this.widget.hintText = this.widget.totalValue.toString();
                              } else {
                                this.widget.secondValue *= -1 ;
                                this.widget.hintText = this.widget.secondValue.toString();
                              }
                              print("用戶點擊 +/-");
                              print(this.widget.pressAction);
                              print(this.widget.hintText);
                              print(this.widget.startAgain);
                              print(this.widget.totalValue);
                              print(this.widget.secondValue);
                            });
                          },
                        ),
                      ),
                      Container(
                        width: 80,
                        height: 80,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Color(0xFFCBCBCB),
                            shape: BoxShape.circle
                        ),
                        child: TextButton(
                          child: Text("%" ,style: TextStyle(fontSize: 32.0, color: Colors.black)),
                          onPressed: () {
                            // 觸發 setState() {}，Flutter 會重新執行 build 函數，
                            // 重新進行頁面渲染
                            setState(() {
                              // 變更原來 Widget 的屬性
                              if (this.widget.startAgain == true) {
                                this.widget.totalValue = this.widget.totalValue / 100 ;
                                this.widget.hintText = this.widget.totalValue.toString();
                              } else {
                                this.widget.secondValue = this.widget.secondValue / 100 ;
                                this.widget.hintText = this.widget.secondValue.toString();
                              }
                              print("用戶點擊 %");
                              print(this.widget.pressAction);
                              print(this.widget.hintText);
                              print(this.widget.startAgain);
                              print(this.widget.totalValue);
                              print(this.widget.secondValue);
                            });
                          },
                        ),
                      ),
                      Container(
                        width: 80,
                        height: 80,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Color(0xFF607D8B),
                            shape: BoxShape.circle
                        ),
                        child: TextButton(
                          child: Text("÷" ,style: TextStyle(fontSize: 32.0, color: Colors.white)),
                          onPressed: () {
                            // 觸發 setState() {}，Flutter 會重新執行 build 函數，
                            // 重新進行頁面渲染
                            setState(() {
                              // 變更原來 Widget 的屬性
                              if (this.widget.startAgain == false) {
                                if (this.widget.pressAction == 1) {
                                  this.widget.hintText = (this.widget.totalValue / this.widget.secondValue).toStringAsFixed(6);
                                  this.widget.totalValue = this.widget.totalValue / this.widget.secondValue;
                                  this.widget.secondValue = 0;
                                  this.widget.startAgain = false;
                                  this.widget.pressAction = 1;
                                } else if (this.widget.pressAction == 2) {
                                  this.widget.hintText = (this.widget.totalValue * this.widget.secondValue).toStringAsFixed(6);
                                  this.widget.totalValue = this.widget.totalValue * this.widget.secondValue;
                                  this.widget.secondValue = 0;
                                  this.widget.startAgain = false;
                                  this.widget.pressAction = 1;
                                } else if (this.widget.pressAction == 3) {
                                  this.widget.hintText = (this.widget.totalValue - this.widget.secondValue).toStringAsFixed(6);
                                  this.widget.totalValue = this.widget.totalValue - this.widget.secondValue;
                                  this.widget.secondValue = 0;
                                  this.widget.startAgain = false;
                                  this.widget.pressAction = 1;
                                } else if (this.widget.pressAction == 4) {
                                  this.widget.hintText = (this.widget.totalValue + this.widget.secondValue).toStringAsFixed(6);
                                  this.widget.totalValue = this.widget.totalValue + this.widget.secondValue;
                                  this.widget.secondValue = 0;
                                  this.widget.startAgain = false;
                                  this.widget.pressAction = 1;
                                } else {
                                  this.widget.pressAction = 1;
                                }
                              } else {
                                this.widget.pressAction = 1;
                                this.widget.hintText = this.widget.totalValue.toString();
                                this.widget.startAgain = false;
                              }
                              print("用戶點擊 ÷");
                              print(this.widget.pressAction);
                              print(this.widget.hintText);
                              print(this.widget.startAgain);
                              print(this.widget.totalValue);
                              print(this.widget.secondValue);

                              UsageAnalysisData data = context.read<UsageAnalysisDataDao>().getData();
                              data.operatorButtonClickTime += 1;
                              context.read<UsageAnalysisDataDao>().updateData(data);
                              print("*** *** *** *** *** ***");
                              print(data);
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Color(0xFFD6B0A7),
                            shape: BoxShape.circle
                        ),
                        child: TextButton(
                          child: Text("7" ,style: TextStyle(fontSize: 32.0, color: Colors.white)),
                          onPressed: () {
                            // 觸發 setState() {}，Flutter 會重新執行 build 函數，
                            // 重新進行頁面渲染
                            setState(() {
                              // 變更原來 Widget 的屬性
                              if (this.widget.startAgain == true) {
                                if (this.widget.totalValue == 0) {
                                  this.widget.totalValue =  7;
                                  this.widget.hintText = this.widget.totalValue.toString();
                                } else {
                                  this.widget.totalValue = double.parse(this.widget.totalValue.toString() + "7");
                                  this.widget.hintText = this.widget.totalValue.toString();
                                }
                              } else if (this.widget.startAgain == false) {
                                if (this.widget.secondValue == 0) {
                                  this.widget.secondValue =  7;
                                  this.widget.hintText = this.widget.secondValue.toString();
                                } else {
                                  this.widget.secondValue = double.parse(this.widget.secondValue.toString() + "7");
                                  this.widget.hintText = this.widget.secondValue.toString();
                                }
                              }
                              print("用戶點擊 7");
                              print(this.widget.pressAction);
                              print(this.widget.hintText);
                              print(this.widget.startAgain);
                              print(this.widget.totalValue);
                              print(this.widget.secondValue);

                              UsageAnalysisData data = context.read<UsageAnalysisDataDao>().getData();
                              data.numberButtonClickTime += 1;
                              context.read<UsageAnalysisDataDao>().updateData(data);
                              print("*** *** *** *** *** ***");
                              print(data);
                            });
                          },
                        ),
                      ),
                      Container(
                        width: 80,
                        height: 80,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Color(0xFFD6B0A7),
                            shape: BoxShape.circle
                        ),
                        child: TextButton(
                          child: Text("8" ,style: TextStyle(fontSize: 32.0, color: Colors.white)),
                          onPressed: () {
                            // 觸發 setState() {}，Flutter 會重新執行 build 函數，
                            // 重新進行頁面渲染
                            setState(() {
                              // 變更原來 Widget 的屬性
                              if (this.widget.startAgain == true) {
                                if (this.widget.totalValue == 0) {
                                  this.widget.totalValue =  8;
                                  this.widget.hintText = this.widget.totalValue.toString();
                                } else {
                                  this.widget.totalValue = double.parse(this.widget.totalValue.toString() + "8");
                                  this.widget.hintText = this.widget.totalValue.toString();
                                }
                              } else if (this.widget.startAgain == false) {
                                if (this.widget.secondValue == 0) {
                                  this.widget.secondValue =  8;
                                  this.widget.hintText = this.widget.secondValue.toString();
                                } else {
                                  this.widget.secondValue = double.parse(this.widget.secondValue.toString() + "8");
                                  this.widget.hintText = this.widget.secondValue.toString();
                                }
                              }
                              print("用戶點擊 8");
                              print(this.widget.pressAction);
                              print(this.widget.hintText);
                              print(this.widget.startAgain);
                              print(this.widget.totalValue);
                              print(this.widget.secondValue);

                              UsageAnalysisData data = context.read<UsageAnalysisDataDao>().getData();
                              data.numberButtonClickTime += 1;
                              context.read<UsageAnalysisDataDao>().updateData(data);
                              print("*** *** *** *** *** ***");
                              print(data);
                            });
                          },
                        ),
                      ),
                      Container(
                        width: 80,
                        height: 80,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Color(0xFFD6B0A7),
                            shape: BoxShape.circle
                        ),
                        child: TextButton(
                          child: Text("9" ,style: TextStyle(fontSize: 32.0, color: Colors.white)),
                          onPressed: () {
                            // 觸發 setState() {}，Flutter 會重新執行 build 函數，
                            // 重新進行頁面渲染
                            setState(() {
                              // 變更原來 Widget 的屬性
                              if (this.widget.startAgain == true) {
                                if (this.widget.totalValue == 0) {
                                  this.widget.totalValue =  9;
                                  this.widget.hintText = this.widget.totalValue.toString();
                                } else {
                                  this.widget.totalValue = double.parse(this.widget.totalValue.toString() + "9");
                                  this.widget.hintText = this.widget.totalValue.toString();
                                }
                              } else if (this.widget.startAgain == false) {
                                if (this.widget.secondValue == 0) {
                                  this.widget.secondValue =  9;
                                  this.widget.hintText = this.widget.secondValue.toString();
                                } else {
                                  this.widget.secondValue = double.parse(this.widget.secondValue.toString() + "9");
                                  this.widget.hintText = this.widget.secondValue.toString();
                                }
                              }
                              print("用戶點擊 9");
                              print(this.widget.pressAction);
                              print(this.widget.hintText);
                              print(this.widget.startAgain);
                              print(this.widget.totalValue);
                              print(this.widget.secondValue);

                              UsageAnalysisData data = context.read<UsageAnalysisDataDao>().getData();
                              data.numberButtonClickTime += 1;
                              context.read<UsageAnalysisDataDao>().updateData(data);
                              print("*** *** *** *** *** ***");
                              print(data);
                            });
                          },
                        ),
                      ),
                      Container(
                        width: 80,
                        height: 80,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Color(0xFF607D8B),
                            shape: BoxShape.circle
                        ),
                        child: TextButton(
                          child: Text("x" ,style: TextStyle(fontSize: 32.0, color: Colors.white)),
                          onPressed: () {
                            // 觸發 setState() {}，Flutter 會重新執行 build 函數，
                            // 重新進行頁面渲染
                            setState(() {
                              // 變更原來 Widget 的屬性
                              if (this.widget.startAgain == false) {
                                if (this.widget.pressAction == 1) {
                                  this.widget.hintText = (this.widget.totalValue / this.widget.secondValue).toStringAsFixed(6);
                                  this.widget.totalValue = this.widget.totalValue / this.widget.secondValue;
                                  this.widget.secondValue = 0;
                                  this.widget.startAgain = false;
                                  this.widget.pressAction = 2;
                                } else if (this.widget.pressAction == 2) {
                                  this.widget.hintText = (this.widget.totalValue * this.widget.secondValue).toStringAsFixed(6);
                                  this.widget.totalValue = this.widget.totalValue * this.widget.secondValue;
                                  this.widget.secondValue = 0;
                                  this.widget.startAgain = false;
                                  this.widget.pressAction = 2;
                                } else if (this.widget.pressAction == 3) {
                                  this.widget.hintText = (this.widget.totalValue - this.widget.secondValue).toStringAsFixed(6);
                                  this.widget.totalValue = this.widget.totalValue - this.widget.secondValue;
                                  this.widget.secondValue = 0;
                                  this.widget.startAgain = false;
                                  this.widget.pressAction = 2;
                                } else if (this.widget.pressAction == 4) {
                                  this.widget.hintText = (this.widget.totalValue + this.widget.secondValue).toStringAsFixed(6);
                                  this.widget.totalValue = this.widget.totalValue + this.widget.secondValue;
                                  this.widget.secondValue = 0;
                                  this.widget.startAgain = false;
                                  this.widget.pressAction = 2;
                                } else {
                                  this.widget.pressAction = 2;
                                }
                              } else {
                                this.widget.pressAction = 2;
                                this.widget.hintText = this.widget.totalValue.toString();
                                this.widget.startAgain = false;
                              }
                              print("用戶點擊 x");
                              print(this.widget.pressAction);
                              print(this.widget.hintText);
                              print(this.widget.startAgain);
                              print(this.widget.totalValue);
                              print(this.widget.secondValue);

                              UsageAnalysisData data = context.read<UsageAnalysisDataDao>().getData();
                              data.operatorButtonClickTime += 1;
                              context.read<UsageAnalysisDataDao>().updateData(data);
                              print("*** *** *** *** *** ***");
                              print(data);
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Color(0xFFD6B0A7),
                            shape: BoxShape.circle
                        ),
                        child: TextButton(
                          child: Text("4" ,style: TextStyle(fontSize: 32.0, color: Colors.white)),
                          onPressed: () {
                            // 觸發 setState() {}，Flutter 會重新執行 build 函數，
                            // 重新進行頁面渲染
                            setState(() {
                              // 變更原來 Widget 的屬性
                              if (this.widget.startAgain == true) {
                                if (this.widget.totalValue == 0) {
                                  this.widget.totalValue =  4;
                                  this.widget.hintText = this.widget.totalValue.toString();
                                } else {
                                  this.widget.totalValue = double.parse(this.widget.totalValue.toString() + "4");
                                  this.widget.hintText = this.widget.totalValue.toString();
                                }
                              } else if (this.widget.startAgain == false) {
                                if (this.widget.secondValue == 0) {
                                  this.widget.secondValue =  4;
                                  this.widget.hintText = this.widget.secondValue.toString();
                                } else {
                                  this.widget.secondValue = double.parse(this.widget.secondValue.toString() + "4");
                                  this.widget.hintText = this.widget.secondValue.toString();
                                }
                              }
                              print("用戶點擊 4");
                              print(this.widget.pressAction);
                              print(this.widget.hintText);
                              print(this.widget.startAgain);
                              print(this.widget.totalValue);
                              print(this.widget.secondValue);

                              UsageAnalysisData data = context.read<UsageAnalysisDataDao>().getData();
                              data.numberButtonClickTime += 1;
                              context.read<UsageAnalysisDataDao>().updateData(data);
                              print("*** *** *** *** *** ***");
                              print(data);
                            });
                          },
                        ),
                      ),
                      Container(
                        width: 80,
                        height: 80,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Color(0xFFD6B0A7),
                            shape: BoxShape.circle
                        ),
                        child: TextButton(
                          child: Text("5" ,style: TextStyle(fontSize: 32.0, color: Colors.white)),
                          onPressed: () {
                            // 觸發 setState() {}，Flutter 會重新執行 build 函數，
                            // 重新進行頁面渲染
                            setState(() {
                              // 變更原來 Widget 的屬性
                              if (this.widget.startAgain == true) {
                                if (this.widget.totalValue == 0) {
                                  this.widget.totalValue =  5;
                                  this.widget.hintText = this.widget.totalValue.toString();
                                } else {
                                  this.widget.totalValue = double.parse(this.widget.totalValue.toString() + "5");
                                  this.widget.hintText = this.widget.totalValue.toString();
                                }
                              } else if (this.widget.startAgain == false) {
                                if (this.widget.secondValue == 0) {
                                  this.widget.secondValue =  5;
                                  this.widget.hintText = this.widget.secondValue.toString();
                                } else {
                                  this.widget.secondValue = double.parse(this.widget.secondValue.toString() + "5");
                                  this.widget.hintText = this.widget.secondValue.toString();
                                }
                              }
                              print("用戶點擊 5");
                              print(this.widget.pressAction);
                              print(this.widget.hintText);
                              print(this.widget.startAgain);
                              print(this.widget.totalValue);
                              print(this.widget.secondValue);

                              UsageAnalysisData data = context.read<UsageAnalysisDataDao>().getData();
                              data.numberButtonClickTime += 1;
                              context.read<UsageAnalysisDataDao>().updateData(data);
                              print("*** *** *** *** *** ***");
                              print(data);
                            });
                          },
                        ),
                      ),
                      Container(
                        width: 80,
                        height: 80,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Color(0xFFD6B0A7),
                            shape: BoxShape.circle
                        ),
                        child: TextButton(
                          child: Text("6" ,style: TextStyle(fontSize: 32.0, color: Colors.white)),
                          onPressed: () {
                            // 觸發 setState() {}，Flutter 會重新執行 build 函數，
                            // 重新進行頁面渲染
                            setState(() {
                              // 變更原來 Widget 的屬性
                              if (this.widget.startAgain == true) {
                                if (this.widget.totalValue == 0) {
                                  this.widget.totalValue =  6;
                                  this.widget.hintText = this.widget.totalValue.toString();
                                } else {
                                  this.widget.totalValue = double.parse(this.widget.totalValue.toString() + "6");
                                  this.widget.hintText = this.widget.totalValue.toString();
                                }
                              } else if (this.widget.startAgain == false) {
                                if (this.widget.secondValue == 0) {
                                  this.widget.secondValue =  6;
                                  this.widget.hintText = this.widget.secondValue.toString();
                                } else {
                                  this.widget.secondValue = double.parse(this.widget.secondValue.toString() + "6");
                                  this.widget.hintText = this.widget.secondValue.toString();
                                }
                              }
                              print("用戶點擊 6");
                              print(this.widget.pressAction);
                              print(this.widget.hintText);
                              print(this.widget.startAgain);
                              print(this.widget.totalValue);
                              print(this.widget.secondValue);

                              UsageAnalysisData data = context.read<UsageAnalysisDataDao>().getData();
                              data.numberButtonClickTime += 1;
                              context.read<UsageAnalysisDataDao>().updateData(data);
                              print("*** *** *** *** *** ***");
                              print(data);
                            });
                          },
                        ),
                      ),
                      Container(
                        width: 80,
                        height: 80,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Color(0xFF607D8B),
                            shape: BoxShape.circle
                        ),
                        child: TextButton(
                          child: Text("-" ,style: TextStyle(fontSize: 32.0, color: Colors.white)),
                          onPressed: () {
                            // 觸發 setState() {}，Flutter 會重新執行 build 函數，
                            // 重新進行頁面渲染
                            setState(() {
                              // 變更原來 Widget 的屬性
                              if (this.widget.startAgain == false) {
                                if (this.widget.pressAction == 1) {
                                  this.widget.hintText = (this.widget.totalValue / this.widget.secondValue).toStringAsFixed(6);
                                  this.widget.totalValue = this.widget.totalValue / this.widget.secondValue;
                                  this.widget.secondValue = 0;
                                  this.widget.startAgain = false;
                                  this.widget.pressAction = 3;
                                } else if (this.widget.pressAction == 2) {
                                  this.widget.hintText = (this.widget.totalValue * this.widget.secondValue).toStringAsFixed(6);
                                  this.widget.totalValue = this.widget.totalValue * this.widget.secondValue;
                                  this.widget.secondValue = 0;
                                  this.widget.startAgain = false;
                                  this.widget.pressAction = 3;
                                } else if (this.widget.pressAction == 3) {
                                  this.widget.hintText = (this.widget.totalValue - this.widget.secondValue).toStringAsFixed(6);
                                  this.widget.totalValue = this.widget.totalValue - this.widget.secondValue;
                                  this.widget.secondValue = 0;
                                  this.widget.startAgain = false;
                                  this.widget.pressAction = 3;
                                } else if (this.widget.pressAction == 4) {
                                  this.widget.hintText = (this.widget.totalValue + this.widget.secondValue).toStringAsFixed(6);
                                  this.widget.totalValue = this.widget.totalValue + this.widget.secondValue;
                                  this.widget.secondValue = 0;
                                  this.widget.startAgain = false;
                                  this.widget.pressAction = 3;
                                } else {
                                  this.widget.pressAction = 3;
                                }
                              } else {
                                this.widget.pressAction = 3;
                                this.widget.hintText = this.widget.totalValue.toString();
                                this.widget.startAgain = false;
                              }
                              print("用戶點擊 -");
                              print(this.widget.pressAction);
                              print(this.widget.hintText);
                              print(this.widget.startAgain);
                              print(this.widget.totalValue);
                              print(this.widget.secondValue);

                              UsageAnalysisData data = context.read<UsageAnalysisDataDao>().getData();
                              data.operatorButtonClickTime += 1;
                              context.read<UsageAnalysisDataDao>().updateData(data);
                              print("*** *** *** *** *** ***");
                              print(data);
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Color(0xFFD6B0A7),
                            shape: BoxShape.circle
                        ),
                        child: TextButton(
                          child: Text("1" ,style: TextStyle(fontSize: 32.0, color: Colors.white)),
                          onPressed: () {
                            // 觸發 setState() {}，Flutter 會重新執行 build 函數，
                            // 重新進行頁面渲染
                            setState(() {
                              // 變更原來 Widget 的屬性
                              if (this.widget.startAgain == true) {
                                if (this.widget.totalValue == 0) {
                                  this.widget.totalValue =  1;
                                  this.widget.hintText = this.widget.totalValue.toString();
                                } else {
                                  this.widget.totalValue = double.parse(this.widget.totalValue.toString() + "1");
                                  this.widget.hintText = this.widget.totalValue.toString();
                                }
                              } else if (this.widget.startAgain == false) {
                                if (this.widget.secondValue == 0) {
                                  this.widget.secondValue =  1;
                                  this.widget.hintText = this.widget.secondValue.toString();
                                } else {
                                  this.widget.secondValue = double.parse(this.widget.secondValue.toString() + "1");
                                  this.widget.hintText = this.widget.secondValue.toString();
                                }
                              }
                              print("用戶點擊 1");
                              print(this.widget.pressAction);
                              print(this.widget.hintText);
                              print(this.widget.startAgain);
                              print(this.widget.totalValue);
                              print(this.widget.secondValue);

                              UsageAnalysisData data = context.read<UsageAnalysisDataDao>().getData();
                              data.numberButtonClickTime += 1;
                              context.read<UsageAnalysisDataDao>().updateData(data);
                              print("*** *** *** *** *** ***");
                              print(data);
                            });
                          },
                        ),
                      ),
                      Container(
                        width: 80,
                        height: 80,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Color(0xFFD6B0A7),
                            shape: BoxShape.circle
                        ),
                        child: TextButton(
                          child: Text("2" ,style: TextStyle(fontSize: 32.0, color: Colors.white)),
                          onPressed: () {
                            // 觸發 setState() {}，Flutter 會重新執行 build 函數，
                            // 重新進行頁面渲染
                            setState(() {
                              // 變更原來 Widget 的屬性
                              if (this.widget.startAgain == true) {
                                if (this.widget.totalValue == 0) {
                                  this.widget.totalValue =  2;
                                  this.widget.hintText = this.widget.totalValue.toString();
                                } else {
                                  this.widget.totalValue = double.parse(this.widget.totalValue.toString() + "2");
                                  this.widget.hintText = this.widget.totalValue.toString();
                                }
                              } else if (this.widget.startAgain == false) {
                                if (this.widget.secondValue == 0) {
                                  this.widget.secondValue =  2;
                                  this.widget.hintText = this.widget.secondValue.toString();
                                } else {
                                  this.widget.secondValue = double.parse(this.widget.secondValue.toString() + "2");
                                  this.widget.hintText = this.widget.secondValue.toString();
                                }
                              }
                              print("用戶點擊 2");
                              print(this.widget.pressAction);
                              print(this.widget.hintText);
                              print(this.widget.startAgain);
                              print(this.widget.totalValue);
                              print(this.widget.secondValue);

                              UsageAnalysisData data = context.read<UsageAnalysisDataDao>().getData();
                              data.numberButtonClickTime += 1;
                              context.read<UsageAnalysisDataDao>().updateData(data);
                              print("*** *** *** *** *** ***");
                              print(data);
                            });
                          },
                        ),
                      ),
                      Container(
                        width: 80,
                        height: 80,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Color(0xFFD6B0A7),
                            shape: BoxShape.circle
                        ),
                        child: TextButton(
                          child: Text("3" ,style: TextStyle(fontSize: 32.0, color: Colors.white)),
                          onPressed: () {
                            // 觸發 setState() {}，Flutter 會重新執行 build 函數，
                            // 重新進行頁面渲染
                            setState(() {
                              // 變更原來 Widget 的屬性
                              if (this.widget.startAgain == true) {
                                if (this.widget.totalValue == 0) {
                                  this.widget.totalValue =  3;
                                  this.widget.hintText = this.widget.totalValue.toString();
                                } else {
                                  this.widget.totalValue = double.parse(this.widget.totalValue.toString() + "3");
                                  this.widget.hintText = this.widget.totalValue.toString();
                                }
                              } else if (this.widget.startAgain == false) {
                                if (this.widget.secondValue == 0) {
                                  this.widget.secondValue =  3;
                                  this.widget.hintText = this.widget.secondValue.toString();
                                } else {
                                  this.widget.secondValue = double.parse(this.widget.secondValue.toString() + "3");
                                  this.widget.hintText = this.widget.secondValue.toString();
                                }
                              }
                              print("用戶點擊 3");
                              print(this.widget.pressAction);
                              print(this.widget.hintText);
                              print(this.widget.startAgain);
                              print(this.widget.totalValue);
                              print(this.widget.secondValue);

                              UsageAnalysisData data = context.read<UsageAnalysisDataDao>().getData();
                              data.numberButtonClickTime += 1;
                              context.read<UsageAnalysisDataDao>().updateData(data);
                              print("*** *** *** *** *** ***");
                              print(data);
                            });
                          },
                        ),
                      ),
                      Container(
                        width: 80,
                        height: 80,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Color(0xFF607D8B),
                            shape: BoxShape.circle
                        ),
                        child: TextButton(
                          child: Text("+" ,style: TextStyle(fontSize: 32.0, color: Colors.white)),
                          onPressed: () {
                            // 觸發 setState() {}，Flutter 會重新執行 build 函數，
                            // 重新進行頁面渲染
                            setState(() {
                              // 變更原來 Widget 的屬性
                              if (this.widget.startAgain == false) {
                                if (this.widget.pressAction == 1) {
                                  this.widget.hintText = (this.widget.totalValue / this.widget.secondValue).toStringAsFixed(6);
                                  this.widget.totalValue = this.widget.totalValue / this.widget.secondValue;
                                  this.widget.secondValue = 0;
                                  this.widget.startAgain = false;
                                  this.widget.pressAction = 4;
                                } else if (this.widget.pressAction == 2) {
                                  this.widget.hintText = (this.widget.totalValue * this.widget.secondValue).toStringAsFixed(6);
                                  this.widget.totalValue = this.widget.totalValue * this.widget.secondValue;
                                  this.widget.secondValue = 0;
                                  this.widget.startAgain = false;
                                  this.widget.pressAction = 4;
                                } else if (this.widget.pressAction == 3) {
                                  this.widget.hintText = (this.widget.totalValue - this.widget.secondValue).toStringAsFixed(6);
                                  this.widget.totalValue = this.widget.totalValue - this.widget.secondValue;
                                  this.widget.secondValue = 0;
                                  this.widget.startAgain = false;
                                  this.widget.pressAction = 4;
                                } else if (this.widget.pressAction == 4) {
                                  this.widget.hintText = (this.widget.totalValue + this.widget.secondValue).toStringAsFixed(6);
                                  this.widget.totalValue = this.widget.totalValue + this.widget.secondValue;
                                  this.widget.secondValue = 0;
                                  this.widget.startAgain = false;
                                  this.widget.pressAction = 4;
                                } else {
                                  this.widget.pressAction = 4;
                                }
                              } else {
                                this.widget.pressAction = 4;
                                this.widget.hintText = this.widget.totalValue.toString();
                                this.widget.startAgain = false;
                              }
                              print("用戶點擊 +");
                              print(this.widget.pressAction);
                              print(this.widget.hintText);
                              print(this.widget.startAgain);
                              print(this.widget.totalValue);
                              print(this.widget.secondValue);

                              UsageAnalysisData data = context.read<UsageAnalysisDataDao>().getData();
                              data.operatorButtonClickTime += 1;
                              context.read<UsageAnalysisDataDao>().updateData(data);
                              print("*** *** *** *** *** ***");
                              print(data);
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 176,
                        height: 80,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Color(0xFFD6B0A7),
                            borderRadius: BorderRadius.all(Radius.circular(40))
                        ),
                        child: TextButton(
                          child: Text("0" ,style: TextStyle(fontSize: 32.0, color: Colors.white)),
                          onPressed: () {
                            // 觸發 setState() {}，Flutter 會重新執行 build 函數，
                            // 重新進行頁面渲染
                            setState(() {
                              // 變更原來 Widget 的屬性
                              if (this.widget.startAgain == true) {
                                if (this.widget.totalValue == 0) {
                                  this.widget.totalValue =  0;
                                  this.widget.hintText = this.widget.totalValue.toString();
                                } else {
                                  this.widget.totalValue = double.parse(this.widget.totalValue.toString() + "0");
                                  this.widget.hintText = this.widget.totalValue.toString();
                                }
                              } else if (this.widget.startAgain == false) {
                                if (this.widget.secondValue == 0) {
                                  this.widget.secondValue =  0;
                                  this.widget.hintText = this.widget.secondValue.toString();
                                } else {
                                  this.widget.secondValue = double.parse(this.widget.secondValue.toString() + "0");
                                  this.widget.hintText = this.widget.secondValue.toString();
                                }
                              }
                              print("用戶點擊 0");
                              print(this.widget.pressAction);
                              print(this.widget.hintText);
                              print(this.widget.startAgain);
                              print(this.widget.totalValue);
                              print(this.widget.secondValue);

                              UsageAnalysisData data = context.read<UsageAnalysisDataDao>().getData();
                              data.numberButtonClickTime += 1;
                              context.read<UsageAnalysisDataDao>().updateData(data);
                              print("*** *** *** *** *** ***");
                              print(data);
                            });
                          },
                        ),
                      ),
                      Container(
                        width: 176,
                        height: 80,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Color(0xFF607D8B),
                            borderRadius: BorderRadius.all(Radius.circular(40))
                        ),
                        child: TextButton(
                          child: Text("=" ,style: TextStyle(fontSize: 32.0, color: Colors.white)),
                          onPressed: () {
                            // 觸發 setState() {}，Flutter 會重新執行 build 函數，
                            // 重新進行頁面渲染
                            setState(() {
                              // 變更原來 Widget 的屬性
                              if (this.widget.pressAction == 1) {
                                this.widget.hintText = (this.widget.totalValue / this.widget.secondValue).toStringAsFixed(6);
                                this.widget.totalValue = this.widget.totalValue / this.widget.secondValue;
                                this.widget.secondValue = 0;
                                this.widget.startAgain = false;
                                this.widget.pressAction = -1;
                              } else if (this.widget.pressAction == 2) {
                                this.widget.hintText = (this.widget.totalValue * this.widget.secondValue).toStringAsFixed(6);
                                this.widget.totalValue = this.widget.totalValue * this.widget.secondValue;
                                this.widget.secondValue = 0;
                                this.widget.startAgain = false;
                                this.widget.pressAction = -1;
                              } else if (this.widget.pressAction == 3) {
                                this.widget.hintText = (this.widget.totalValue - this.widget.secondValue).toStringAsFixed(6);
                                this.widget.totalValue = this.widget.totalValue - this.widget.secondValue;
                                this.widget.secondValue = 0;
                                this.widget.startAgain = false;
                                this.widget.pressAction = -1;
                              } else if (this.widget.pressAction == 4) {
                                this.widget.hintText = (this.widget.totalValue + this.widget.secondValue).toStringAsFixed(6);
                                this.widget.totalValue = this.widget.totalValue + this.widget.secondValue;
                                this.widget.secondValue = 0;
                                this.widget.startAgain = false;
                                this.widget.pressAction = -1;
                              }
                              print("用戶點擊 =");
                              print(this.widget.pressAction);
                              print(this.widget.hintText);
                              print(this.widget.startAgain);
                              print(this.widget.totalValue);
                              print(this.widget.secondValue);

                              UsageAnalysisData data = context.read<UsageAnalysisDataDao>().getData();
                              data.equalitySignButtonClickTime += 1;
                              context.read<UsageAnalysisDataDao>().updateData(data);
                              print("*** *** *** *** *** ***");
                              print(data);
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
    );
  }
}