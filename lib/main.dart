import 'package:flutter/material.dart';

void main() {
  runApp(const HomePage());
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Colors.deepPurple[200],
          appBar: AppBar(
            title: Text('BMI CALCULATOR'),
            backgroundColor: Colors.deepPurple,
          ),
          body: Column(
            children: [
              Expanded(
                  child: Row(
                children: [
                  Expanded(
                      child: Container(
                    margin: EdgeInsets.all(25.0),
                    color: Colors.amber,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Icon(Icons.male), Text('MALE')],
                    ),
                  )),
                  Expanded(
                      child: Container(
                    margin: EdgeInsets.all(25.0),
                    color: Colors.blue,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Icon(Icons.female), Text('FEMALE')],
                    ),
                  ))
                ],
              )),
              Expanded(
                  child: Container(
                margin: EdgeInsets.all(25.0),
                color: Colors.cyan,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('HEIGHT'),
                    Row(
                      textBaseline: TextBaseline.alphabetic,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      children: [Text('183'), Text('cm')],
                    ),
                    Slider(
                        value: 175,
                        min: 120,
                        max: 220,
                        onChanged: (double newValue) => {})
                  ],
                ),
              )),
              Expanded(
                  child: Row(
                children: [
                  Expanded(
                      child: Container(
                    margin: EdgeInsets.all(25.0),
                    color: Colors.deepOrange,
                    child: Column(
                      children: [
                        Text('WEIGHT'),
                        Text('74'),
                        Row(
                          children: [
                            FloatingActionButton(onPressed: () => {}),
                            FloatingActionButton(onPressed: () => {})
                          ],
                        )
                      ],
                    ),
                  )),
                  Expanded(
                      child: Container(
                    margin: EdgeInsets.all(25.0),
                    color: Colors.deepOrange,
                    child: Column(
                      children: [
                        Text('WEIGHT'),
                        Text('74'),
                        Row(
                          children: [
                            FloatingActionButton(onPressed: () => {}),
                            FloatingActionButton(onPressed: () => {})
                          ],
                        )
                      ],
                    ),
                  ))
                ],
              )),
              Container(
                color: Colors.red,
                child: Center(child: Text('CALCULATE BMI')),
                height: 80.0,
                width: double.infinity,
              )
            ],
          )),
    );
  }
}
