import 'package:flutter/material.dart';

class IconAndText extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
   Color textColor;
  final String text;

  IconAndText(
      {required this.icon,
      required this.iconColor,
      required this.text,
       this.textColor = const Color(0xFFccc7c5)});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon,color: iconColor,),
        SizedBox(
          width: 4,
        ),
        Text(text , style: TextStyle(
          fontSize: 13,
          fontFamily: 'Roboto',
          color: textColor,
        ),)
      ],
    );
  }
}
