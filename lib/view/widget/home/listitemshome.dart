import 'package:ecommerce_application/controller/homepage_controller.dart';
import 'package:ecommerce_application/core/constant/color.dart';
import 'package:ecommerce_application/data/model/itemsmodel.dart';
import 'package:ecommerce_application/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class ListItemsHome extends GetView<HomepageControllerImp> {
  const ListItemsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //color: AppColor.primaryColor,
      height: 240,
      child: ListView.builder(
          itemCount: controller.items.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Items(
                ontap: () {},
                itemsModel: ItemModel.fromJson(controller.items[index]));
          }),
    );
  }
}

class Items extends StatelessWidget {
  final ItemModel itemsModel;
  final void Function() ontap;
  const Items({super.key, required this.itemsModel, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              child: Image.network(
                "${AppLink.imageItems}/${itemsModel.itemsImage}",
                height: 100,
                width: 140,
                fit: BoxFit.fitHeight,
              ),
            ),
            Flexible(
              child: Text(
                "${itemsModel.itemsName}",
                style: const TextStyle(
                    color: AppColor.black,
                    // fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ),
            Text(
              "${itemsModel.itemsPrice} DZD",
              style: const TextStyle(
                  color: AppColor.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            Text(
              "${itemsModel.itemsDiscount} %OFF",
              style: const TextStyle(
                  color: AppColor.black,
                  // fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
