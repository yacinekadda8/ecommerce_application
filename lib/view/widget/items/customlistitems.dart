import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_application/controller/favorite_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/items_controller.dart';
import '../../../core/constant/color.dart';
import '../../../data/model/itemsmodel.dart';
import '../../../linkapi.dart';

class CustomListItem extends GetView<ItemsControllerImp> {
  //final bool isFav;
  final ItemsModel itemsModel;
  const CustomListItem({
    super.key,
    required this.itemsModel,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToItemsDetailsScreen(itemsModel);
      },
      child: Container(
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
    );
  }
}
