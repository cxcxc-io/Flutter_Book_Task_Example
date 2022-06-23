import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/usage_analysis_data.dart';

class UsageAnalysisDataDao extends ChangeNotifier {

  UsageAnalysisData usageData = UsageAnalysisData(
      numberButtonClickTime: 0, operatorButtonClickTime: 0,
      equalitySignButtonClickTime: 0);

  UsageAnalysisData getData() {
    return usageData;
  }

  void updateData(UsageAnalysisData data) {
    usageData = data;
    notifyListeners();
  }
}