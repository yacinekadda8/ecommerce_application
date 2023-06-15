import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CustomTitle extends StatelessWidget {
  final String title;
  final Color color = AppColor.white;
  const CustomTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(title,
        style: TextStyle(
            fontSize: 28,
            color: color,
            fontWeight: FontWeight.bold,
            fontFamily: "arial"));
  }
}
