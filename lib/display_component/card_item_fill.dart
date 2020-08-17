import 'package:flutter/material.dart';
import 'package:flutter_bmi_calculator/constant_value.dart';

const double iconSize = 90.0;
const sizedBoxHeight = 15.0;

class CardItemFill extends StatelessWidget {
  final IconData icon;
  final String label;

  CardItemFill({@required this.icon, @required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          this.icon,
          size: 50,
          color: Color(0xFFFFFF00),
        ),
        SizedBox(
          height: sizedBoxHeight,
        ),
        Text(
          this.label,
          style: cvLabelTextStyle,
        ),
      ],
    );
  }
}
