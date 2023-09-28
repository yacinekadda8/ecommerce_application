import 'package:ecommerce_application/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constant/approutes.dart';

class MyOrders extends StatelessWidget {
  const MyOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColor.backgroundcolor,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            const Text(
              "My Orders",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 40,
                color: AppColor.silverGreen,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            ListTile(
              onTap: () {
                Get.toNamed(AppRoute.orderspending);
              },
              title: const Text("Pending",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  )),
              leading: const Icon(Icons.local_shipping,
                  color: AppColor.silverGreen, size: 40),
              trailing: const Icon(Icons.keyboard_arrow_right, size: 30),
              tileColor: AppColor.backgroundcolor,
              iconColor: AppColor.white,
              textColor: AppColor.white,
            ),
            ListTile(
              onTap: () {
                Get.toNamed(AppRoute.ordersarchive);
              },
              title: const Text("Archive",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  )),
              leading: const Icon(Icons.fact_check,
                  color: AppColor.silverGreen, size: 40),
              trailing: const Icon(Icons.keyboard_arrow_right, size: 30),
              tileColor: AppColor.backgroundcolor,
              iconColor: AppColor.white,
              textColor: AppColor.white,
            ),
          ],
        ),
      ),
    );
  }
}
