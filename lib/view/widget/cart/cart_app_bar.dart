import 'package:ecommerce_application/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartAppBAr extends StatelessWidget {
  const CartAppBAr({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: IconButton(
                  onPressed: () {
                    Get.back();
                    //Get.offAndToNamed(AppRoute.itemdetails);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    size: 24,
                    color: AppColor.primaryblueColor,
                  )),
            ),
            Container(
              alignment: Alignment.center,
              child: const Text(
                'MY CART',
                maxLines: 1,
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: 30,
                    height: 1.2,
                    fontWeight: FontWeight.bold,
                    color: AppColor.primaryblueColor),
              ),
            ),
            const SizedBox(width: 100)
          ],
        ),
      ),
    );
  }
}
