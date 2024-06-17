import 'package:flutter/material.dart';

import 'constants.dart';
import 'components/gender_card.dart';
import 'pages/input_page.dart';

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
        theme:
            ThemeData(scaffoldBackgroundColor: const Color(appBackgroundColor)),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
                title: const Text(
                  'BMI CALCULATOR',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                backgroundColor: const Color(appBarColor)),
            body: const InputPage()));
  }
}
