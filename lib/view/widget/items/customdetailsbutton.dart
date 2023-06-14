import 'package:flutter/material.dart';

class CustomDetailsButton extends StatelessWidget {
  final Color borderColor;
  final Color bgColor;
  final Color textColor;
  final String text;
  const CustomDetailsButton(
      {super.key,
      required this.borderColor,
      required this.bgColor,
      required this.textColor,
      required this.text});
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
        side: BorderSide(
          color: borderColor,
          width: 3.0,
        ),
      ),
      color: bgColor,
      onPressed: () {},
      child: Text(text,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: textColor,
            fontFamily: "arial",
          )),
    );
  }
}
