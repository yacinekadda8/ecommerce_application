import 'package:ecommerce_application/controller/itemdetails_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';

class ItemName extends GetView<ItemDetailsControllerImp> {
  const ItemName({super.key});

  @override
  Widget build(BuildContext context) {
    return Text("${controller.itemsModel.itemsName}".toUpperCase(),
        maxLines: 2,
        style: const TextStyle(
          fontSize: 25,
          overflow: TextOverflow.ellipsis,
          color: AppColor.white,
          fontFamily: "arial",
        ));
  }
}
