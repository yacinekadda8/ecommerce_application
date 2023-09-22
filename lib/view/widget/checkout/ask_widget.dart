import 'package:ecommerce_application/core/constant/color.dart';
import 'package:flutter/material.dart';

class AskWidget extends StatelessWidget {
  final String qstion;
  const AskWidget({super.key, required this.qstion});

  @override
  Widget build(BuildContext context) {
    return Text(
      qstion,
      style: const TextStyle(fontSize: 26, color: AppColor.primaryblueColor),
    );
  }
}