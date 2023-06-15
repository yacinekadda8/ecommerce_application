import 'package:ecommerce_application/core/class/handlingdataview.dart';
import 'package:ecommerce_application/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/items_controller.dart';
import '../../data/model/itemsmodel.dart';
import '../widget/customappbar.dart';
import '../widget/items/customlistitems.dart';
import '../widget/items/listcategoriesitems.dart';

class Items extends StatelessWidget {
  const Items({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsControllerImp());

    return Scaffold(
      backgroundColor: AppColor.backgroundcolor,
      body: Container(
          height: Get.height,
          padding: const EdgeInsets.all(15),
          child: ListView(children: [
            CustomAppBar(
              hintText: "search",
              icon: Icons.notifications_outlined,
              onPressedIcon: () {},
              onPressedSearch: () {},
            ),
            const ListCategoriesItems(),
            const SizedBox(height: 5),
            GetBuilder<ItemsControllerImp>(
                builder: (controller) => HandlingDataView(
                    statusRequest: controller.statusRequest,
                    widget: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                          childAspectRatio: 0.73,
                        ),
                        itemCount: controller.data.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return CustomListItem(
                              //isFav: false,
                              itemsModel:
                                  ItemsModel.fromJson(controller.data[index]));
                        })))
          ])),
    );
  }
}
