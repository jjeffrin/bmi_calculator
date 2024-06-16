import 'package:flutter/material.dart';

class SliderCard extends StatelessWidget {
  const SliderCard(
      {super.key, required this.onChanged, required this.currentValue});

  final void Function(double)? onChanged;
  final double currentValue;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Color(0XFF121428),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('HEIGHT', style: TextStyle(color: Colors.white)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  currentValue.toInt().toString(),
                  style: TextStyle(color: Colors.white),
                ),
                Text('cm', style: TextStyle(color: Colors.white))
              ],
            ),
            Slider(
                value: currentValue,
                min: 120.0,
                max: 220.0,
                onChanged: onChanged)
          ],
        ),
      ),
    ));
  }
}
