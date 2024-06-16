import "package:flutter/material.dart";

enum Gender {male, female}

class GenderCard extends StatelessWidget {
  const GenderCard(
      {super.key,
      required this.gender,
      required this.cardColor,
      required this.textColor,
      this.onTap});

  final Gender gender;
  final int cardColor;
  final int textColor;
  final void Function()? onTap;

  IconData getIcon() {
    if (gender == Gender.male) return Icons.male;
    return Icons.female;
  }

  String getCardTitle() {
    if (gender == Gender.male) return 'MALE';
    return 'FEMALE';
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: Color(cardColor), borderRadius: BorderRadius.circular(8.0)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              getIcon(),
              color: Color(textColor),
              size: 80.0,
            ),
            SizedBox(height: 15.0),
            Text(
              getCardTitle(),
              style: TextStyle(
                  color: Color(textColor),
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0),
            )
          ],
        ),
      ),
    );
  }
}
