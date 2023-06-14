import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_application/controller/itemdetails_controller.dart';
import 'package:ecommerce_application/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../linkapi.dart';
import '../widget/customappbar.dart';
import '../widget/items/customdetailsbutton.dart';

class ItemDetails extends StatelessWidget {
  const ItemDetails({super.key});

  @override
  Widget build(BuildContext context) {
    ItemDetailsControllerImp controller = Get.put(ItemDetailsControllerImp());
    return Scaffold(
      body: Container(
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
                  Hero(
                    tag: "${controller.itemsModel.itemsId}",
                    child: CachedNetworkImage(
                      imageUrl:
                          "${AppLink.imageItems}/${controller.itemsModel.itemsImage}",
                      height: 280,
                      width: 480,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  Positioned(
                      top: 210, // Adjust the top position of the button
                      right: 40, // Adjust the left position of the button
                      child: IconButton(
                        icon: const Icon(
                          Icons.favorite_border_outlined,
                          color: AppColor.silverGreen,
                          size: 60,
                        ),
                        onPressed: () {
                          /// Add to watchlist ///
                        },
                      )),
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
                  Container(
                    color: AppColor.silverGreen,
                    height: 60,
                    //padding: const EdgeInsets.only(bottom: 8),
                    margin: const EdgeInsets.only(top: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("${controller.itemsModel.itemsPrice} DZD",
                            style: const TextStyle(
                                //backgroundColor: AppColor.primaryblueColor,
                                fontSize: 28,
                                color: AppColor.black,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Serif")),
                        Text("% ${controller.itemsModel.itemsDiscount} OFF",
                            maxLines: 1,
                            style: const TextStyle(
                                //backgroundColor: AppColor.primaryblueColor,
                                fontSize: 28,
                                color: AppColor.black,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Serif")),
                      ],
                    ),
                  ),
                  const Text("Description:",
                      style: TextStyle(
                          fontSize: 28,
                          color: AppColor.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: "arial")),
                  Text("${controller.itemsModel.itemsDesc}",
                      maxLines: 7,
                      style: const TextStyle(
                        fontSize: 20,
                        color: AppColor.grey,
                        fontWeight: FontWeight.normal,
                        fontFamily: "arial",
                        overflow: TextOverflow.ellipsis,
                      )),
                  const Text("Choise a color:",
                      style: TextStyle(
                          fontSize: 28,
                          color: AppColor.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: "arial")),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: AppColor.silverGreen, width: 4),
                            color: Colors.blueGrey,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15))),
                        height: 60,
                        width: 90,
                      ),
                      const SizedBox(width: 5),
                      Container(
                        decoration: const BoxDecoration(
                            color: Colors.pink,
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        height: 60,
                        width: 90,
                      ),
                      const SizedBox(width: 5),
                      Container(
                        decoration: const BoxDecoration(
                            color: Colors.blue,
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        height: 60,
                        width: 90,
                      ),
                      const SizedBox(width: 5),
                      Container(
                        decoration: const BoxDecoration(
                            color: Colors.grey,
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        height: 60,
                        width: 90,
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 30),
                    child: Row(
                      //mainAxisSize: MainAxisSize.max,
                      //crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomDetailsButton(
                          borderColor: AppColor.primaryblueColor,
                          bgColor: AppColor.backgroundcolor,
                          textColor: AppColor.primaryblueColor,
                          text: 'Add to cart',
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: CustomDetailsButton(
                            borderColor: AppColor.primaryblueColor,
                            bgColor: AppColor.primaryblueColor,
                            textColor: AppColor.black,
                            text: 'Buy it Now',
                          ),
                        ),

                        /*
                  CustomDetailsButton(
                    borderColor: AppColor.primaryblueColor,
                    bgColor: AppColor.backgroundcolor,
                    textColor: AppColor.primaryblueColor,
                    text: 'Add to watchlist',
                  ), */
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
