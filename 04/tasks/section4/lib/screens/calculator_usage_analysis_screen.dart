import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/common_drawer.dart';
import '../daos/usage_analysis_data_dao.dart';

class CalculatorUsageAnalysisScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: CommonDrawer.getDrawer(context),
      body: Container(
        margin: EdgeInsets.only(top: 10),
        alignment: Alignment.topCenter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 50,
              child: Text(
                  "您目前點擊 0 - 9 數字鍵的總數： " +
                  context.read<UsageAnalysisDataDao>().getData().numberButtonClickTime.toString(),
                  style: TextStyle(fontSize: 24),
              )
            ),
            Container(
                height: 50,
                child: Text(
                    "您目前點擊 + - x ÷ 鍵的總數： " +
                        context.read<UsageAnalysisDataDao>().getData().operatorButtonClickTime.toString(),
                    style: TextStyle(fontSize: 24),
                )
            ),
            Container(
                height: 50,
                child: Text(
                    "您目前點擊 = 鍵的總數： " +
                        context.read<UsageAnalysisDataDao>().getData().equalitySignButtonClickTime.toString(),
                    style: TextStyle(fontSize: 24),
                )
            )
          ],
        ),
      ),
    );
  }
}