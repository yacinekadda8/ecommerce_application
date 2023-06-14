import 'package:ecommerce_application/controller/homepage_controller.dart';
import 'package:ecommerce_application/core/class/handlingdataview.dart';
import 'package:ecommerce_application/core/constant/color.dart';
import 'package:ecommerce_application/view/widget/customappbar.dart';
import 'package:ecommerce_application/view/widget/home/customcardhome.dart';
import 'package:ecommerce_application/view/widget/home/customtitlehome.dart';
import 'package:ecommerce_application/view/widget/home/list_categories_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/home/listitemshome.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());

    return GetBuilder<HomeControllerImp>(
        builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Container(
                color: AppColor.backgroundcolor,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: ListView(
                    children: [
                      CustomAppBar(
                        hintText: "search",
                        icon: Icons.notifications_outlined,
                        onPressedIcon: () {},
                        onPressedSearch: () {},
                      ),
                       CustomCardHome(
                        title: "42".tr,
                        subtitle: "43".tr, // cashback
                      ),
                      CustomTitleHome(title: "39".tr), // Explore the categoreis
                      const ListCategoriesHome(),
                       CustomTitleHome(title: "40".tr),
                      const ListItemsHome(),
                       CustomTitleHome(title: "41".tr),
                      const ListItemsHome(),

                      /*
                          SizedBox(
                            height: 500,
                            child: GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10,
                                ),
                                itemCount: 10,
                                scrollDirection: Axis.vertical,
                                itemBuilder: (context, index) {
                                  return Stack(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: AppColor.primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(18),
                                        ),
                                        height: 240,
                                        width: 200,
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(top: 10),
                                        height: 140,
                                        width: 200,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(18),
                                        ),
                                        child: Image.asset(
                                          "assets/images/products/p1.jpg",
                                          fit: BoxFit.fitHeight,
                                        ),
                                      ),
                                      const Positioned(
                                          top: 140,
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 20),
                                            child: Text(
                                              "MOTHERBOARD",
                                              style: TextStyle(
                                                  color: AppColor.white,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ))
                                    ],
                                  );
                                }),
                          ),
                          */
                    ],
                  ),
                ))));
  }
}
