import 'package:ecommerce_application/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomCardHome extends StatelessWidget {
  final String title;
  final String subtitle;

  const CustomCardHome({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(children: [
        Container(
          alignment: Alignment.center,
          height: 150,
          decoration: BoxDecoration(
              color: AppColor.primaryColor,
              borderRadius: BorderRadius.circular(20)),
          child:  ListTile(
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
        Positioned(
          top: -20,
          right: -20,
          child: Container(
            height: 160,
            width: 160,
            decoration: BoxDecoration(
              color: AppColor.secoundColor,
              borderRadius: BorderRadius.circular(160),
            ),
          ),
        )
      ]),
    );
  }
}
