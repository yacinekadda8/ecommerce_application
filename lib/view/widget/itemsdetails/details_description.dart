import 'package:ecommerce_application/view/widget/itemsdetails/custom_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/itemdetails_controller.dart';
import '../../../core/constant/color.dart';

class DetailsDiscriotion extends GetView<ItemDetailsControllerImp> {
  const DetailsDiscriotion({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CustomTitle(
          title: "Description:",
        ),
        Text("${controller.itemsModel.itemsDesc}",
            maxLines: 7,
            style: const TextStyle(
              fontSize: 20,
              color: AppColor.grey,
              fontWeight: FontWeight.normal,
              fontFamily: "arial",
              overflow: TextOverflow.ellipsis,
            )),
      ],
    );
  }
}
