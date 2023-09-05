import 'package:ecommerce_application/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/home_controller.dart';

class CustomCardHome extends GetView<HomeControllerImp> {
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
                fontSize: 22,
                fontWeight: FontWeight.bold,
              )),
          subtitle: Text(subtitle,
              style: const TextStyle(
                color: AppColor.white,
                fontSize: 28,
                fontWeight: FontWeight.normal,
              )),
        ),
      ),
      Positioned(
        top: -32,
        right: controller.lang == "en" ? -30 : null,
        left: controller.lang == "ar" ? -30 : null,
        child: Container(
          height: 110,
          width: 110,
          decoration: BoxDecoration(
            color: AppColor.silverGreen,
            borderRadius: BorderRadius.circular(160),
          ),
        ),
      ),
    ]);
  }
}
