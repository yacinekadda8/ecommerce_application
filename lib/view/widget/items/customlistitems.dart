import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_application/controller/favorite_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../controller/items_controller.dart';
import '../../../core/constant/color.dart';
import '../../../data/model/itemsmodel.dart';
import '../../../linkapi.dart';
import '../home/discount.dart';

class CustomListItem extends GetView<ItemsControllerImp> {
  //final bool isFav;
  final ItemsModel itemsModel;
  const CustomListItem({
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
      ) 
      );
  }
}


/*

Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: AppColor.white,
        ),
        height: Get.height,

        /*  decoration: BoxDecoration(color: AppColor.itemsColor, gradient: const LinearGradient(colors: [AppColor.white,AppColor.primaryblueColor,],begin: Alignment.topCenter,end: Alignment.bottomCenter, ), borderRadius: BorderRadius.circular(8),),*/
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.circular(4),
              ),
              width: Get.width,
              height: Get.height / 5.5,
              child: /* Hero(
                  tag: "${itemsModel.itemsId}",
                  child: */ CachedNetworkImage(
                    imageUrl: "${AppLink.imageItems}/${itemsModel.itemsImage}",
                    alignment: Alignment.center,
                    fit: BoxFit.contain,
                  ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                "${itemsModel.itemsName}".toUpperCase(),
                maxLines: 1,
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontFamily: "sans",
                  fontWeight: FontWeight.bold,
                  fontSize: 19,
                  overflow: TextOverflow.ellipsis,
                  color: AppColor.primaryblueColor,
                ),
              ),
            ),
            Center(
              child: Text(
                "${itemsModel.itemsPrice.toString()} DZD",
                style: const TextStyle(
                  fontFamily: "sans",
                  fontSize: 26,
                  color: AppColor.silverGreen,
                  fontWeight: FontWeight.bold,
                  height: 2.2,
                  letterSpacing: 0.01,
                  wordSpacing: 0.1,
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "${itemsModel.itemsDiscount} % OFF".toUpperCase(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontFamily: "sans",
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                    color: AppColor.backgroundcolor,
                    backgroundColor: AppColor.white,
                    height: .9,
                  ),
                ),
                GetBuilder<FavoriteController>(
                  builder: (controller) => Padding(
                    padding: const EdgeInsets.only(top: 0),
                    child: IconButton(
                      color: AppColor.primaryblueColor,
                      iconSize: 40,
                      alignment: Alignment.topCenter,
                      onPressed: () {
                        if (controller.isFavorite[itemsModel.itemsId] == 1) {
                          controller
                              .removeFavorite(itemsModel.itemsId.toString());
                          controller.setFavorite(itemsModel.itemsId, 0);
                        } else {
                          controller.addFavorite(itemsModel.itemsId.toString());
                          controller.setFavorite(itemsModel.itemsId, 1);
                        }
                      },
                      icon: Icon(
                        controller.isFavorite[itemsModel.itemsId] == 1
                            ? Icons.favorite
                            : Icons.favorite_outline_rounded,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    )


*/