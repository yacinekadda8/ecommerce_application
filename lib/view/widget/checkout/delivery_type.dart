import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';

class DeliveryType extends StatelessWidget {
  final String title;
  final bool isActive;
  final IconData icon;
  const DeliveryType({
    Key? key,
    required this.title,
    required this.isActive,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height / 6,
      width: Get.width / 3,
      decoration: BoxDecoration(
          color: AppColor.itemsColor,
          border: Border.all(
            color: isActive == true
                ? AppColor.silverGreen
                : AppColor.backgroundcolor,
            width: 4,
          ),
          borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // flex: 1,
          Icon(
            icon,
            color: isActive == true
                ? AppColor.silverGreen
                : AppColor.backgroundcolor,
            size: 70,
          ),

          Text(
            title,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 26,
              color: isActive == true
                  ? AppColor.silverGreen
                  : AppColor.backgroundcolor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
