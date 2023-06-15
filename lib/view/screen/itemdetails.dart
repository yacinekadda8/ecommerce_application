import 'package:ecommerce_application/controller/itemdetails_controller.dart';
import 'package:ecommerce_application/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/customappbar.dart';
import '../widget/itemsdetails/buy_and_addtocard.dart';
import '../widget/itemsdetails/details_description.dart';
import '../widget/itemsdetails/favorate_icon.dart';
import '../widget/itemsdetails/item_colors.dart';
import '../widget/itemsdetails/item_image.dart';
import '../widget/itemsdetails/price_and_discount.dart';
import '../widget/itemsdetails/quantity.dart';

class ItemDetails extends StatelessWidget {
  const ItemDetails({super.key});

  @override
  Widget build(BuildContext context) {
    ItemDetailsControllerImp controller = Get.put(ItemDetailsControllerImp());
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        color: AppColor.backgroundcolor,
        child: ListView(
          children: [
            CustomAppBar(
              hintText: "search",
              icon: Icons.notifications_outlined,
              onPressedIcon: () {},
              onPressedSearch: () {},
            ),
            Container(
              height: 300,
              color: AppColor.white,
              child: Stack(
                children: [
                  const ItemImage(),
                  FavorateIcon(onPressed: () {}),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                textDirection: TextDirection.ltr,
                children: [
                  Text("${controller.itemsModel.itemsName}".toUpperCase(),
                      maxLines: 2,
                      style: const TextStyle(
                        fontSize: 25,
                        overflow: TextOverflow.ellipsis,
                        color: AppColor.white,
                        fontFamily: "arial",
                      )),
                  const PriceAndDiscount(),
                  const DetailsDiscriotion(),
                  const ItemColors(),
                  const SizedBox(height: 20),
                  const Quantity(),
                  const BuyAndAddToCard(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
