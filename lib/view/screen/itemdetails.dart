import 'package:ecommerce_application/controller/itemdetails_controller.dart';
import 'package:ecommerce_application/core/class/handlingdataview.dart';
import 'package:ecommerce_application/core/constant/color.dart';
import 'package:ecommerce_application/core/constant/approutes.dart';
import 'package:ecommerce_application/view/widget/itemsdetails/item_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//import '../widget/customappbar.dart';
import '../widget/itemsdetails/buy_and_addtocard.dart';
import '../widget/itemsdetails/details_description.dart';
//import '../widget/itemsdetails/favorate_icon.dart';
import '../widget/itemsdetails/item_image.dart';
import '../widget/itemsdetails/price_and_discount.dart';
import '../widget/itemsdetails/quantity.dart';

class ItemDetails extends StatelessWidget {
  const ItemDetails({super.key});

  @override
  Widget build(BuildContext context) {
    ItemDetailsControllerImp itemDetailsControllerImp =
        Get.put(ItemDetailsControllerImp());
    return Scaffold(
        body: GetBuilder<ItemDetailsControllerImp>(
      builder: (controller) => HandlingDataView(
          statusRequest: itemDetailsControllerImp.statusRequest,
          widget: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            color: AppColor.backgroundcolor,
            child: ListView(
              children: [
                Stack(
                  children: [
                    Container(
                        height: Get.height / 2.5,
                        color: AppColor.white,
                        child:
                            const ItemImage() //FavorateIcon(onPressed: () {}),
                        ),
                    controller.itemsModel.itemsDiscount != 0
                        ? Positioned(
                            top: Get.height / 3,
                            left: 230,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 4),
                              decoration: const BoxDecoration(
                                  color: AppColor.red,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(50.0),
                                      bottomRight: Radius.circular(50.0))),
                              child: Text(
                                  "%${controller.itemsModel.itemsDiscount}",
                                  maxLines: 1,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      //backgroundColor: AppColor.primaryblueColor,
                                      fontSize: 26,
                                      height: 1.3,
                                      color: AppColor.backgroundcolor,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Serif")),
                            ),
                          )
                        : const SizedBox(),
                    Positioned(
                      top: 10,
                      left: 10,
                      child: IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios_rounded,
                            color: AppColor.primaryblueColor,
                            size: 30,
                          )),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    textDirection: TextDirection.ltr,
                    children: [
                      const ItemName(),
                      const PriceAndDiscount(),
                      const DetailsDiscriotion(),
                      // SubItemsList(),
                      const SizedBox(height: 20),
                      Quantity(
                        quantity: "${itemDetailsControllerImp.itemsCount}",
                        onAddTap: () {
                          itemDetailsControllerImp.addCount();
                        },
                        onRemoveTap: () {
                          itemDetailsControllerImp.removeCount();
                        },
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: GoToCard(
                          text: 'Go to cart',
                          onPressed: () {
                            // controller.cartController.refreshCartPage();
                            Get.toNamed(AppRoute.cart);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    ));
  }
}
