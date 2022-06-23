import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/calculator_screen.dart';
import 'screens/state_change_demo_screen.dart';
import 'screens/calculator_usage_analysis_screen.dart';
import 'daos/usage_analysis_data_dao.dart';

void main() {
  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => UsageAnalysisDataDao())
        ],
        child: AppEntryPoint(),
    )
  );
}

class AppEntryPoint extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "4-4 question demo",
      theme: ThemeData(
        primarySwatch: Colors.indigo
      ),
      routes: {
        "/change-sate": (BuildContext context) => StateChangeDemoScreen(),
        "/calculator": (BuildContext context) => Calculator(),
        "/usage-analysis": (BuildContext context) => CalculatorUsageAnalysisScreen()
      },
      initialRoute: "/change-sate"
    );
  }
}