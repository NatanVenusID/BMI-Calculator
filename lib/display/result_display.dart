
import 'package:flutter/material.dart';
import 'package:flutter_bmi_calculator/constant_value.dart';
import 'package:flutter_bmi_calculator/display_component/calculate_button.dart';
import 'package:flutter_bmi_calculator/display_component/card_item_select.dart';


class ResultDisplay extends StatelessWidget {
  final String bmiResult;
  final String resultText;
  final String interpretation;

  ResultDisplay(
      {@required this.bmiResult,
      @required this.resultText,
      @required this.interpretation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: cvTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: CardItemSelect(
              color: cvSelectedCardColor,
              cardItemChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    resultText,
                    style: cvResultTextStyle,
                  ),
                  Text(
                    bmiResult,
                    style: cvBMITextStyle,
                  ),
                  Text(
                    interpretation,
                    textAlign: TextAlign.center,
                    style: cvResultBodyTextStyle,
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
              onTap: () {
                Navigator.pop(context);
              },
              buttonTitle: 'RE-CALCULATE'),
        ],
      ),
    );
  }
}
