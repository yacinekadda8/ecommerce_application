import 'package:ecommerce_application/core/class/handlingdataview.dart';
import 'package:ecommerce_application/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/favorites_view_controller.dart';
import '../widget/custom_notification_btn.dart';
import '../widget/myfavorites/list_favorite_items.dart';

class Myfavorites extends StatelessWidget {
  const Myfavorites({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(FavoritesViewController());
    return Scaffold(
        backgroundColor: AppColor.backgroundcolor,
        appBar: AppBar(
          title: const Text(
            "My Favorites",
            style: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.bold,
              color: AppColor.silverGreen,
            ),
          ),
          actionsIconTheme: const IconThemeData(color: AppColor.silverGreen),
          iconTheme: const IconThemeData(color: AppColor.silverGreen),
          actions: const [CustomNotificationBtn()],
        ),
        body: GetBuilder<FavoritesViewController>(
            builder: (controller) => SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HandlingDataView(
                          statusRequest: controller.statusRequest,
                          widget: ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: controller.data.length,
                              itemBuilder: (context, index) {
                                return ListFavoriteItems(
                                    itemsModel: controller.data[index]);
                              }))
                    ],
                  ),
                )));
  }
}
