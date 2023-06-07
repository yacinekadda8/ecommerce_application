import 'package:ecommerce_application/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomTitleHome extends StatelessWidget {
  final String title;
  const CustomTitleHome({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(title,
        style: const TextStyle(
            fontSize: 26,
            color: AppColor.secoundColor,
            fontWeight: FontWeight.bold));
  }
}
