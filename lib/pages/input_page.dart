import 'package:bmi_calculator/bmi_calculator.dart';
import 'package:bmi_calculator/components/gender_card.dart';
import 'package:bmi_calculator/components/mutable_card.dart';
import 'package:bmi_calculator/components/slider_card.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/pages/results_page.dart';
import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  double selectedHeight = 160.0;
  int selectedWeight = 65;
  int selectedAge = 18;

  void updateGender(Gender gender) {
    selectedGender = gender;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
              const SizedBox(
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
        )),
        const SizedBox(
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
        const SizedBox(
          height: 10.0,
        ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
              const SizedBox(
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
        GestureDetector(
          onTap: () {
            BmiCalculator calc = BmiCalculator(
                height: selectedHeight.toInt(), weight: selectedWeight);

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ResultsPage(
                  value: calc.calculateBMI(),
                  category: calc.getResult(),
                  description: calc.getInterpretation(),
                ),
              ),
            );
          },
          child: Container(
              margin: const EdgeInsets.only(top: 40.0),
              height: bottomButtonHeight,
              color: const Color(bottomButtonColor),
              child: const Center(child: Text('CALCULATE YOUR BMI'))),
        )
      ],
    );
  }
}
