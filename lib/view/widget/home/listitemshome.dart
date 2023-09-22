import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_application/controller/home_controller.dart';
import 'package:ecommerce_application/core/constant/color.dart';
import 'package:ecommerce_application/data/model/itemsmodel.dart';
import 'package:ecommerce_application/linkapi.dart';
import 'package:ecommerce_application/view/widget/home/discount.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:intl/intl.dart';

class ListItemsHome extends GetView<HomeControllerImp> {
  const ListItemsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //color: AppColor.primaryColor,
      height: 280,

      child: ListView.builder(
          itemCount: controller.items.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Items(
                itemsModel: ItemsModel.fromJson(controller.items[index]));
          }),
    );
  }
}

class Items extends GetView<HomeControllerImp> {
  final ItemsModel itemsModel;
  const Items({
    super.key,
    required this.itemsModel,
  });

  @override
  Widget build(BuildContext context) {
    double itemAfterDiscount = itemsModel.itemsPrice! -
        (itemsModel.itemsPrice! * itemsModel.itemsDiscount! / 100);
    return InkWell(
      onTap: () {
        controller.goToItemsDetailsScreen(itemsModel);
      },
      child: Stack(
        children: [
          Container(
            width: 180,
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(4),
                  child: CachedNetworkImage(
                    imageUrl: "${AppLink.imageItems}/${itemsModel.itemsImage}",
                    height: 100,
                    width: 140,
                    fit: BoxFit.fitHeight,
                  ),
                ),
                SizedBox(
                  width: 160,
                  child: Center(
                    child: Text(
                      "${itemsModel.itemsName}",
                      style: const TextStyle(
                          overflow: TextOverflow.ellipsis,
                          color: AppColor.black,
                          fontFamily: "serif",
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                ),
                Text(
                  NumberFormat.currency(locale: 'ar_DZ', decimalDigits: 2)
                      .format(itemAfterDiscount),
                  style: const TextStyle(
                      fontFamily: "sans",
                      overflow: TextOverflow.ellipsis,
                      color: AppColor.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                Text(
                  NumberFormat.currency(locale: 'ar_DZ', decimalDigits: 2)
                      .format(itemsModel.itemsPrice),
                  style: const TextStyle(
                      fontFamily: "sans",
                      decoration: TextDecoration.lineThrough,
                      decorationThickness: 2.0,
                      overflow: TextOverflow.ellipsis,
                      color: AppColor.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 16),
                ),
              ],
            ),
          ),
          itemsModel.itemsDiscount != 0
              ? Discount(
                itemsDiscount: itemsModel.itemsDiscount,
              )
              : const SizedBox(),
        ],
      ),
    );
  }
}
