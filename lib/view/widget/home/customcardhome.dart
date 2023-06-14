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
    return SizedBox(
      child: Stack(children: [
        Container(
          alignment: Alignment.center,
          height: 150,
          decoration: BoxDecoration(
              color: AppColor.primaryblueColor,
              borderRadius: BorderRadius.circular(20)),
          child: ListTile(
            title: Text(title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )),
            subtitle: Text(subtitle,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                )),
          ),
        ),
        rightAndLeft(
        Positioned(
          top: -18,
          left: -20,
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
          top: -18,
          right: -20,
          child: Container(
            height: 140,
            width: 140,
            decoration: BoxDecoration(
              color: AppColor.silverGreen,
              borderRadius: BorderRadius.circular(160),
            ),
          ),
        )
        )


      ]),
    );
  }
}
