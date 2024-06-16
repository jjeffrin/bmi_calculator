import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class MutableCard extends StatelessWidget {
  const MutableCard(
      {super.key,
      required this.title,
      required this.currentValue,
      required this.onIncrement,
      required this.onDecrement});

  final String title;
  final int currentValue;
  final void Function()? onIncrement;
  final void Function()? onDecrement;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Color(inActiveCardColor),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(color: Colors.white),
            ),
            Text(
              currentValue.toString(),
              style: TextStyle(color: Colors.white),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(onPressed: onIncrement, icon: Icon(Icons.add)),
                IconButton(onPressed: onDecrement, icon: Icon(Icons.remove))
              ],
            )
          ],
        ),
      ),
    );
  }
}
