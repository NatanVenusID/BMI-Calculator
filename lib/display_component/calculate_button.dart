import 'package:flutter/material.dart';
import 'package:flutter_bmi_calculator/constant_value.dart';

class BottomButton extends StatelessWidget {
  final Function onTap;
  final String buttonTitle;

  BottomButton({@required this.onTap, @required this.buttonTitle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: cvCalculateContainerColor,
        margin: EdgeInsets.only(top: 10.0),
        height: cvCalculateContainerHeight,
        width: double.infinity,
        child: Center(
          child: Text(
            buttonTitle,
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w700,color: Color(0xFFFFa31a)),
          ),
        ),
      ),
    );
  }
}
