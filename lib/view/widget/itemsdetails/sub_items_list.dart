import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../controller/itemdetails_controller.dart';
import '../../../core/constant/color.dart';
import 'custom_boxcolor.dart';
import 'custom_title.dart';

class SubItemsList extends GetView<ItemDetailsControllerImp> {
  const SubItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 4.0),
          child: CustomTitle(
            title: "Choise a color:",
          ),
        ),
        Row(
          children: [
            ...List.generate(
              controller.subitems.length,
              (index) => CustomBoxColor(
                  name: controller.subitems[index]['name'].toUpperCase(),
                  bordercolor: controller.subitems[index]['active'] == '1'
                      ? AppColor.primaryblueColor
                      : AppColor.backgroundcolor),
            )
          ],
        ),
      ],
    );
  }
}
