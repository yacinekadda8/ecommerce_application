import 'package:ecommerce_application/core/constant/color.dart';
import 'package:flutter/material.dart';

import '../../../core/functions/right_and_left.dart';

class CustomCardHome extends StatelessWidget {
  final String title;
  final String subtitle;

  const CustomCardHome(
      {super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        alignment: Alignment.center,
        height: 150,
        decoration: BoxDecoration(
            color: AppColor.primaryblueColor,
            borderRadius: BorderRadius.circular(10)),
        child: ListTile(
          title: Text(title,
              style: const TextStyle(
                color: AppColor.backgroundcolor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              )),
          subtitle: Text(subtitle,
              style: const TextStyle(
                color: AppColor.white,
                fontSize: 36,
                fontWeight: FontWeight.normal,
              )),
        ),
      ),
      rightAndLeft(
          Positioned(
            top: -24,
            left: -28,
            child: Container(
              height: 140,
              width: 140,
              decoration: BoxDecoration(
                color: AppColor.silverGreen,
                borderRadius: BorderRadius.circular(160),
              ),
            ),
          ),
          Positioned(
            top: -24,
            right: -28,
            child: Container(
              height: 140,
              width: 140,
              decoration: BoxDecoration(
                color: AppColor.silverGreen,
                borderRadius: BorderRadius.circular(160),
              ),
            ),
          )),
    ]);
  }
}
