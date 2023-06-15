import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/itemdetails_controller.dart';
import '../../../core/constant/color.dart';

class PriceAndDiscount extends GetView<ItemDetailsControllerImp> {
  const PriceAndDiscount({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.silverGreen,
      height: 60,
      //padding: const EdgeInsets.only(bottom: 8),
      margin: const EdgeInsets.only(top: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text("${controller.itemsModel.itemsPrice} DZD",
              style: const TextStyle(
                  //backgroundColor: AppColor.primaryblueColor,
                  fontSize: 28,
                  color: AppColor.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Serif")),
          Text("% ${controller.itemsModel.itemsDiscount} OFF",
              maxLines: 1,
              style: const TextStyle(
                  //backgroundColor: AppColor.primaryblueColor,
                  fontSize: 28,
                  color: AppColor.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Serif")),
        ],
      ),
    );
  }
}
