import 'package:ecommerce_application/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/items_controller.dart';
import '../widget/customappbar.dart';
import '../widget/items/listcategoriesitems.dart';

class Items extends StatelessWidget {
  const Items({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ItemsControllerImp contrller = Get.put(ItemsControllerImp());

    return Scaffold(
      backgroundColor: AppColor.backgroundcolor,
      body: Container(
        padding: const EdgeInsets.all(15),
        child: ListView(children: [
          CustomAppBar(
            hintText: "search",
            icon: Icons.notifications_outlined,
            onPressedIcon: () {},
            onPressedSearch: () {},
          ),
          const ListCategoriesItems(),
        ]),
      ),
    );
  }
}
