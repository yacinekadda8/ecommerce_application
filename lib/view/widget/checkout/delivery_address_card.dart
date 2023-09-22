import 'package:ecommerce_application/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeliveryAddressCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isActive;
  const DeliveryAddressCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      child: Card(
        color: AppColor.itemsColor,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        elevation: 5,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: isActive == true
                  ? AppColor.silverGreen
                  : AppColor.backgroundcolor, // Set your desired border color
              width: 4, // Set your desired border width
            ),
            borderRadius: BorderRadius.circular(15.0), // Rounded corners
          ),
          child: SizedBox(
            child: ListTile(
              title: Text(
                title.toUpperCase(),
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 24.0,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold,
                  color: isActive == true
                      ? AppColor.silverGreen
                      : AppColor.backgroundcolor,
                ),
              ),
              textColor: AppColor.backgroundcolor,
              subtitle: Text(
                subtitle,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Roboto',
                  color: isActive == true
                      ? AppColor.silverGreen
                      : AppColor.backgroundcolor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
