import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../controller/itemdetails_controller.dart';
import '../../../core/constant/color.dart';

class PriceAndDiscount extends GetView<ItemDetailsControllerImp> {
  const PriceAndDiscount({super.key});

  @override
  Widget build(BuildContext context) {
    double itemAfterDiscount = controller.itemsModel.itemsPrice! -
        (controller.itemsModel.itemsPrice! *
            controller.itemsModel.itemsDiscount! /
            100);
    return Container(
      color: AppColor.silverGreen,
      //height: 60,
      //padding: const EdgeInsets.only(bottom: 8),
      margin: const EdgeInsets.only(top: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // itemsPriceDiscount = null
          Text(
              NumberFormat.currency(locale: 'ar_DZ', decimalDigits: 2)
                  .format(itemAfterDiscount),
              style: const TextStyle(
                  //backgroundColor: AppColor.primaryblueColor,
                  fontSize: 20,
                  color: AppColor.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Serif")),

          Text("${controller.itemsModel.itemsPrice}",
              style: const TextStyle(
                  //backgroundColor: AppColor.primaryblueColor,
                  decoration: TextDecoration.lineThrough,
                  decorationThickness: 2.0,
                  fontSize: 20,
                  color: AppColor.black,
                  fontWeight: FontWeight.normal,
                  fontFamily: "Serif")),
          Text("% ${controller.itemsModel.itemsDiscount} OFF",
              maxLines: 1,
              style: const TextStyle(
                  //backgroundColor: AppColor.primaryblueColor,
                  fontSize: 20,
                  color: AppColor.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Serif")),
        ],
      ),
    );
  }
}
