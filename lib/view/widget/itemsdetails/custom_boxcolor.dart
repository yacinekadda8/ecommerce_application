import 'package:flutter/material.dart';


class CustomBoxColor extends StatelessWidget {
  final Color color;
  final Color? bordercolor;
  const CustomBoxColor({super.key, required this.color, required this.bordercolor});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: bordercolor!, width: 4),
          color: color,
          borderRadius: const BorderRadius.all(Radius.circular(15))),
      height: 60,
      width: 90,
    );
  }
}
