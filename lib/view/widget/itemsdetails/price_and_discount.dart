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
      decoration: BoxDecoration(
          color: AppColor.white, borderRadius: BorderRadius.circular(5)),
      height: 50,
      //padding: const EdgeInsets.only(bottom: 8),
      margin: const EdgeInsets.only(top: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // itemsPriceDiscount = null
          Text(
              NumberFormat.currency(locale: 'ar_DZ', decimalDigits: 2)
                  .format(itemAfterDiscount),
              style: const TextStyle(
                  //backgroundColor: AppColor.primaryblueColor,
                  fontSize: 16,
                  color: AppColor.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Serif")),

          Text(
              NumberFormat.currency(locale: 'ar_DZ', decimalDigits: 2)
                  .format(controller.itemsModel.itemsPrice),
              maxLines: 1,
              style: const TextStyle(
                  //backgroundColor: AppColor.primaryblueColor,
                  decoration: TextDecoration.lineThrough,
                  decorationThickness: 2.0,
                  fontSize: 16,
                  color: AppColor.black,
                  fontWeight: FontWeight.normal,
                  fontFamily: "Serif")),
        ],
      ),
    );
  }
}
