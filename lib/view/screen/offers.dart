import 'package:ecommerce_application/controller/offers_controller.dart';
import 'package:ecommerce_application/core/class/handlingdataview.dart';
import 'package:ecommerce_application/core/constant/color.dart';
import 'package:ecommerce_application/view/screen/home.dart';
import 'package:ecommerce_application/view/widget/customappbar.dart';
import 'package:ecommerce_application/view/widget/offers/custom_offers_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/favorite_controller.dart';
import '../../core/constant/routes.dart';

class Offers extends StatelessWidget {
  const Offers({super.key});

  @override
  Widget build(BuildContext context) {
    /* FavoriteController controllerFav = */ Get.put(FavoriteController());
    /* OffersController offersController = */ Get.put(OffersController());
    var myHeight = Get.height;

    return Container(
      color: AppColor.primaryblueColor,
      child: GetBuilder<OffersController>(
          builder: (controller) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: ListView(
                  children: [
                    CustomAppBar(
                        isSearching: controller.isSearch,
                        textSearchController: controller.textSearchController!,
                        onChanged: (value) {
                          //value = controller.textSearchController.text;
                          controller.checkSearch(value);
                        },
                        hintText: "search",
                        icon: Icons.notifications_outlined,
                        //onPressedNotifIcon: () {},
                        onPressedFavoriteIcon: () {
                          Get.toNamed(AppRoute.myfavorites);
                        },
                        onPressedSearch: () => controller.onSearchItems(),
                        onPressedX: () => controller.clearSearch()),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 12.0),
                      alignment: Alignment.center,
                      height: Get.width / 5,
                      decoration: const BoxDecoration(
                          //color: AppColor.silverGreen,
                          borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      )),
                      child: const Text(
                        'OFFERS',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 80,
                          color: Colors.white,
                          height: 1.1,
                        ),
                      ),
                    ),
                    HandlingDataView(
                        statusRequest: controller.statusRequest,
                        widget: controller.isSearch == false
                            ? Column(
                                children: [
                                  const SizedBox(height: 20),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: GridView.builder(
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 1,
                                          crossAxisSpacing: 8,
                                          mainAxisSpacing: 8,
                                          childAspectRatio:
                                              (Get.width) / (myHeight / 2.5),
                                        ),
                                        itemCount: controller.data.length,
                                        scrollDirection: Axis.vertical,
                                        itemBuilder: (context, index) {
                                          return CustomOfferItem(
                                              //isFav: false,
                                              itemsModel:
                                                  controller.data[index]);
                                        }),
                                  ),
                                ],
                              )
                            : SearchList(
                                listSearchDataModel:
                                    controller.listSearchDataModel,
                              )),
                  ],
                ),
              )),
    );
  }
}
