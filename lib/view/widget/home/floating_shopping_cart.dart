import 'package:ecommerce_application/core/constant/color.dart';
import 'package:ecommerce_application/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FlotingShoppingCart extends StatelessWidget {
  const FlotingShoppingCart({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        clipBehavior: Clip.antiAlias,
        elevation: 0,
        backgroundColor: AppColor.silverGreen,
        onPressed: () {
          Get.toNamed(AppRoute.cart);
        },
        child: const Icon(
          Icons.shopping_cart,
          color: AppColor.backgroundcolor,
        ));
  }
}
