import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_application/controller/homepage_controller.dart';
import 'package:ecommerce_application/core/constant/color.dart';
import 'package:ecommerce_application/data/model/itemsmodel.dart';
import 'package:ecommerce_application/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

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
                ontap: () {
                  
                },
                itemsModel: ItemsModel.fromJson(controller.items[index]));
          }),
    );
  }
}

class Items extends StatelessWidget {
  final ItemsModel itemsModel;
  final void Function() ontap;
  const Items({super.key, required this.itemsModel, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
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
              "${itemsModel.itemsPrice.toString()} DZD",
              style: const TextStyle(
                  fontFamily: "sans",
                  overflow: TextOverflow.ellipsis,
                  color: AppColor.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            Text(
              "${itemsModel.itemsDiscount} %OFF",
              style: const TextStyle(
                  color: AppColor.black,
                  fontFamily: "serif",
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
