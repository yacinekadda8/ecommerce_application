import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class PaymentMethod extends StatelessWidget {
  final String title;
  final bool isActive;
  const PaymentMethod({super.key, required this.title, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
          color: AppColor.itemsColor,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            width: 4,
            color: isActive == true ? AppColor.silverGreen : AppColor.black,
          )),
      child: Center(
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 30,
            height: 1.2,
            fontWeight: FontWeight.bold,
            color: isActive == true ? AppColor.silverGreen : AppColor.black,
          ),
        ),
      ),
    );
  }
}
