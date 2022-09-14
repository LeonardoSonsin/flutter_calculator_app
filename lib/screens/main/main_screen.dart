import 'package:flutter/material.dart';
import 'package:flutter_calculator_app/screens/main/widgets/calculator_layout.dart';
import 'package:flutter_calculator_app/screens/main/widgets/my_appbar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppBar(),
      body: CalculatorLayout(),
    );
  }
}
