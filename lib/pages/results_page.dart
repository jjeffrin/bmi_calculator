import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/pages/input_page.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({super.key, required this.category, required this.value, required this.description});

  final String category;
  final String value;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            'BMI CALCULATOR',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Color(appBarColor)),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.only(bottom: 20.0, left: 20.0),
              alignment: Alignment.topLeft,
              child: Text('Your Result', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 40.0),),
            ),
          ),
          Expanded(
            flex: 9,
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.all(20.0),
                padding: EdgeInsets.all(10.0),
                color: Color(activeCardColor),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(category, style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 16.0),),
                Text(value, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 96.0)),
                Text(description, style: TextStyle(color: Colors.white), textAlign: TextAlign.center,),
              ],
            ),
          )),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
                margin: const EdgeInsets.only(top: 40.0),
                height: bottomButtonHeight,
                color: const Color(bottomButtonColor),
                child: const Center(child: Text('RE-CALCULATE YOUR BMI'))),
          )
        ],
      ),
    );
  }
}
