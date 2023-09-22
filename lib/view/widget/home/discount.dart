import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class Discount extends StatelessWidget {
  final int? itemsDiscount;
  const Discount({super.key, required this.itemsDiscount});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 10,
      left: 10,
      child: Container(
        height: 35,
        //width: 70,
        decoration: const BoxDecoration(
          color: AppColor.red,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12.0),
            bottomRight: Radius.circular(12.0),
          ),
        ),
        child: Center(
          child: Text(
            " -$itemsDiscount% ",
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: AppColor.black,
                height: 1.1,
                fontFamily: "serif",
                fontWeight: FontWeight.bold,
                fontSize: 22),
          ),
        ),
      ),
    );
  }
}
