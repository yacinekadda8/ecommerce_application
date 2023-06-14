import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/items_controller.dart';
import '../../../core/constant/color.dart';
import '../../../data/model/itemsmodel.dart';
import '../../../linkapi.dart';

class CustomListItems extends GetView<ItemsControllerImp> {
  final ItemsModel itemsModel;
  const CustomListItems({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToItemsDetailsScreen(itemsModel);
      },
      child: Card(
        elevation: 7,
        color: AppColor.itemsColor,
        /*  decoration: BoxDecoration(color: AppColor.itemsColor, gradient: const LinearGradient(colors: [AppColor.white,AppColor.primaryblueColor,],begin: Alignment.topCenter,end: Alignment.bottomCenter, ), borderRadius: BorderRadius.circular(8),),*/
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.circular(4),
                ),
                width: 180,
                height: 110,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6.0),
                  child: Hero(
                      tag: "${itemsModel.itemsId}",
                      child: CachedNetworkImage(
                        imageUrl:
                            "${AppLink.imageItems}/${itemsModel.itemsImage}",
                        alignment: Alignment.center,
                        fit: BoxFit.fitHeight,
                      )),
                ),
              ),
              Text(
                "${itemsModel.itemsName}".toUpperCase(),
                style: const TextStyle(
                  fontFamily: "sans",
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  overflow: TextOverflow.ellipsis,
                  color: AppColor.primaryblueColor,
                ),
              ),
              Center(
                child: Text(
                  "${itemsModel.itemsDiscount} % OFF".toUpperCase(),
                  style: const TextStyle(
                    fontFamily: "sans",
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                    color: AppColor.backgroundcolor,
                    backgroundColor: AppColor.white,
                    height: 1.5,
                    letterSpacing: 0.01,
                    wordSpacing: 0.1,
                  ),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "${itemsModel.itemsPrice} DZD",
                    style: const TextStyle(
                      fontFamily: "sans",
                      fontSize: 20,
                      color: AppColor.silverGreen,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 0),
                    child: IconButton(
                      color: AppColor.primaryblueColor,
                      iconSize: 34,
                      onPressed: () {},
                      icon: const Icon(
                        Icons.favorite_outline_rounded,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
