import 'package:ecommerce_application/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomBoxColor extends StatelessWidget {
  final String name;
  final Color? bordercolor;
  const CustomBoxColor(
      {super.key, required this.name, required this.bordercolor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2),
      decoration: BoxDecoration(
          border: Border.all(color: bordercolor!, width: 4),
          borderRadius: const BorderRadius.all(Radius.circular(15))),
      height: 55,
      width: 85,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 6.0),
          child: Text(
            textAlign: TextAlign.start,
            name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColor.primaryblueColor,
            ),
          ),
        ),
      ),
    );
  }
}
