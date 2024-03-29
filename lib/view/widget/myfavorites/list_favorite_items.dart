import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_application/controller/favorites_view_controller.dart';
import 'package:ecommerce_application/data/model/myfavoritemodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';
import '../../../linkapi.dart';

class ListFavoriteItems extends GetView<FavoritesViewController> {
  //final bool isFav;
  final MyFavoriteModel itemsModel;
  const ListFavoriteItems({
    super.key,
    required this.itemsModel,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
       // controller.goToItemsDetailsScreen(itemsModel);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
        height: Get.height / 4,
        decoration: BoxDecoration(
            color: AppColor.primaryblueColor.withOpacity(.3),
            borderRadius: const BorderRadius.all(Radius.circular(23)),
            border: Border.all(
              width: 7.2,
              color: AppColor.white,
            )),
        /*  decoration: BoxDecoration(color: AppColor.itemsColor, gradient: const LinearGradient(colors: [AppColor.white,AppColor.primaryblueColor,],begin: Alignment.topCenter,end: Alignment.bottomCenter, ), borderRadius: BorderRadius.circular(8),),*/
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              //margin: const EdgeInsets.all(4.0),
              decoration: const BoxDecoration(
                color: AppColor.white,
                //borderRadius: BorderRadius.circular(5),
              ),
              width: Get.width / 2.8,
              height: Get.height,
              child:/* Hero(
                  tag: "${itemsModel.itemsId}",
                  child:*/ CachedNetworkImage(
                    imageUrl: "${AppLink.imageItems}/${itemsModel.itemsImage}",
                    alignment: Alignment.center,
                    fit: BoxFit.fitWidth,
                  ),
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(left: 10, right: 4),
              padding: const EdgeInsets.only(left: 2, right: 2),
              width: Get.width / 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 60,
                    child: Text(
                      "${itemsModel.itemsName}".trim().toUpperCase(),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      softWrap: true,
                      style: const TextStyle(
                        fontFamily: "Courier",
                        color: AppColor.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: Get.width / 5,
                        child: Text(
                          itemsModel.itemsPrice.toString(),
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            fontFamily: "Courier",
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.ellipsis,
                            color: AppColor.white,
                            height: 1.25,
                          ),
                        ),
                      ),
                      const Text(
                        "DZD",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontFamily: "Courier",
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis,
                          color: AppColor.red,
                          height: 1.25,
                        ),
                      ),
                      const SizedBox(width: 2),
                      Text(
                        "${itemsModel.itemsDiscount} %OFF".toUpperCase(),
                        style: TextStyle(
                          fontFamily: "sans",
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis,
                          color: AppColor.backgroundcolor,
                          backgroundColor: AppColor.silverGreen.withOpacity(.8),
                          height: 1.5,
                          letterSpacing: 0.01,
                          wordSpacing: 0.1,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MaterialButton(
                          onPressed: () {},
                          child: Icon(
                            Icons.shopping_cart,
                            size: 55,
                            color: AppColor.silverGreen.withOpacity(.8),
                          )),
                      MaterialButton(
                          onPressed: () {
                            controller.deleteFavorites(
                                itemsModel.favoriteId.toString());
                          },
                          child: Icon(
                            Icons.delete_rounded,
                            size: 55,
                            color: AppColor.red.withOpacity(.7),
                          )),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
