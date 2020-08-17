import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final Function onPressed;

  RoundIconButton({@required this.icon, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon, size: 16,),
      constraints: BoxConstraints.tightFor(
        width: 28.0,
        height: 28.0,
      ),
      elevation: 10.0,
      shape: CircleBorder(),
      fillColor: Color(0xFFFF9900),
      onPressed: onPressed,
    );
  }
}
