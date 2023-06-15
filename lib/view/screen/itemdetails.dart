import 'package:ecommerce_application/controller/itemdetails_controller.dart';
import 'package:ecommerce_application/core/constant/color.dart';
import 'package:ecommerce_application/view/widget/itemsdetails/item_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/customappbar.dart';
import '../widget/itemsdetails/buy_and_addtocard.dart';
import '../widget/itemsdetails/details_description.dart';
import '../widget/itemsdetails/favorate_icon.dart';
import '../widget/itemsdetails/sub_items_list.dart';
import '../widget/itemsdetails/item_image.dart';
import '../widget/itemsdetails/price_and_discount.dart';
import '../widget/itemsdetails/quantity.dart';

class ItemDetails extends StatelessWidget {
  const ItemDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemDetailsControllerImp());
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
              height: Get.height / 2.5,
              color: AppColor.white,
              child: Stack(
                children: [
                  const ItemImage(),
                  FavorateIcon(onPressed: () {}),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                textDirection: TextDirection.ltr,
                children: [
                  ItemName(),
                  PriceAndDiscount(),
                  DetailsDiscriotion(),
                  SubItemsList(),
                  SizedBox(height: 20),
                  Quantity(),
                  BuyAndAddToCard(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
