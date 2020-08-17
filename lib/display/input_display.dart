import 'package:flutter/material.dart';
import 'package:flutter_bmi_calculator/display/result_display.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_bmi_calculator/display_component/calculate_button.dart';
import 'package:flutter_bmi_calculator/display_component/card_item_fill.dart';
import 'package:flutter_bmi_calculator/display_component/card_item_select.dart';
import 'package:flutter_bmi_calculator/display_component/round_button.dart';
import 'package:flutter_bmi_calculator/constant_value.dart';
import 'package:flutter_bmi_calculator/bmi_count.dart';

enum Gender {
  Male,
  Female,
}

class InputDisplay extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputDisplay> {
  Gender selectedGender;

  int height = 180;
  double minHeight = 100;
  double maxHeight = 220;

  int weight = 60;
  int age = 28;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: CardItemSelect(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.Male;
                      });
                    },
                    color: selectedGender == Gender.Male
                        ? cvMaleSelectedCardColor
                        : cvUnSelectedCardColor,
                    cardItemChild: CardItemFill(
                      icon: FontAwesomeIcons.mars, 
                      label: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: CardItemSelect(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.Female;
                      });
                    },
                    color: selectedGender == Gender.Female
                        ? cvFemaleSelectedCardColor
                        : cvUnSelectedCardColor,
                    cardItemChild: CardItemFill(
                      icon: FontAwesomeIcons.venus,
                      label: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: CardItemSelect(
              color: cvSelectedCardColor,
              cardItemChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: cvLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: cvNumberTextStyle,
                      ),
                      Text(
                        'cm',
                        style: cvLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Color(0xFF00FFFF),
                      inactiveTrackColor: Color(0xFF8D8E98),
                      thumbColor: Color(0xFFFFFF00),
                      overlayColor: Color(0xFFFF9900),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 10.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 18.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: minHeight,
                      max: maxHeight,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: CardItemSelect(
                    color: cvSelectedCardColor,
                    cardItemChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: cvLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: cvNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(width: 10.0),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: CardItemSelect(
                    color: cvSelectedCardColor,
                    cardItemChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: cvLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: cvNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(width: 10.0),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            onTap: () {
              BmiCount calc =
                  BmiCount(height: height, weight: weight);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultDisplay(
                            bmiResult: calc.calculateBMI(),
                            resultText: calc.getResult(),
                            interpretation: calc.getInterpretation(),
                          )));
            },
            buttonTitle: 'CALCULATE',
          ),
        ],
      ),
    );
  }
}
