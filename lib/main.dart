import 'package:flutter/material.dart';

import 'components/slider_card.dart';
import 'constants.dart';
import 'components/gender_card.dart';
import 'components/mutable_card.dart';

void main() {
  runApp(const HomePage());
}


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Gender? selectedGender;
  double selectedHeight = 160.0;
  int selectedWeight = 65;
  int selectedAge = 18;

  void updateGender(Gender gender) {
    selectedGender = gender;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: Color(appBackgroundColor),
            appBar: AppBar(
                title: Text(
                  'BMI CALCULATOR',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                backgroundColor: Color(appBarColor)),
            body: Column(
              children: [
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                    child: Row(
                      children: [
                        Expanded(
                          child: GenderCard(
                            gender: Gender.male,
                            cardColor: selectedGender == Gender.male
                                ? activeCardColor
                                : inActiveCardColor,
                            textColor: selectedGender == Gender.male
                                ? activeCardTextColor
                                : inActiveCardTextColor,
                            onTap: () {
                              setState(() => updateGender(Gender.male));
                            },
                          ),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Expanded(
                          child: GenderCard(
                            gender: Gender.female,
                            cardColor: selectedGender == Gender.female
                                ? activeCardColor
                                : inActiveCardColor,
                            textColor: selectedGender == Gender.female
                                ? activeCardTextColor
                                : inActiveCardTextColor,
                            onTap: () {
                              setState(() => updateGender(Gender.female));
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
                SizedBox(
                  height: 10.0,
                ),
                SliderCard(
                  onChanged: (double newHeight) {
                    setState(() {
                      selectedHeight = newHeight;
                    });
                  },
                  currentValue: selectedHeight,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    children: [
                      MutableCard(
                        title: 'WEIGHT',
                        currentValue: selectedWeight,
                        onIncrement: () {
                          setState(() {
                            selectedWeight++;
                          });
                        },
                        onDecrement: () {
                          setState(() {
                            selectedWeight--;
                          });
                        },
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      MutableCard(
                        title: 'AGE',
                        currentValue: selectedAge,
                        onIncrement: () {
                          setState(() {
                            selectedAge++;
                          });
                        },
                        onDecrement: () {
                          setState(() {
                            selectedAge--;
                          });
                        },
                      )
                    ],
                  ),
                )),
                Container(
                    margin: EdgeInsets.only(top: 40.0),
                    height: bottomButtonHeight,
                    color: Color(bottomButtonColor),
                    child: Center(child: Text('CALCULATE YOUR BMI')))
              ],
            )));
  }
}

