import 'package:ecommerce_application/controller/homescreen_controller.dart';
import 'package:ecommerce_application/core/constant/color.dart';
import 'package:ecommerce_application/view/widget/home/floating_shopping_cart.dart';
import 'package:ecommerce_application/view/widget/home/my_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
        builder: (controller) => Scaffold(
              backgroundColor: AppColor.backgroundcolor,
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              floatingActionButton: const FlotingShoppingCart(),
              bottomNavigationBar: const MyBottomNavigationBar(),
              body: controller.listPage.elementAt(controller.currentpage),
            ));
  }
}
