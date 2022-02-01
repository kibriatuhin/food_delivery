import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? size;
  TextOverflow overflow;

  BigText({
    Key? key,
    required this.text,
    this.color = const Color(0xFF332d2b),
    this.overflow = TextOverflow.ellipsis,
    this.size = 19,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text ,
      maxLines: 1,
      style: TextStyle(
      color: color,
      fontWeight: FontWeight.w400,
      fontSize: size,
      fontFamily: 'Roboto',
    ),);
  }
}
