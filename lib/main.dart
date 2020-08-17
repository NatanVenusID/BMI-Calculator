import 'package:flutter/material.dart';
import 'package:flutter_bmi_calculator/display/input_display.dart';


void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF2f2f2f),
        scaffoldBackgroundColor: Color(0xFF2f2f2f),
      ),
      home: InputDisplay(),
    );
  }
}
