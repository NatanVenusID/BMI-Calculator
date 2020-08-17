import 'package:flutter/material.dart';

class CardItemSelect extends StatelessWidget {
  final Color color;
  final Widget cardItemChild;
  final Function onPress;

  CardItemSelect({@required this.color, this.cardItemChild, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardItemChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: this.color,
        ),
      ),
    );
  }
}
