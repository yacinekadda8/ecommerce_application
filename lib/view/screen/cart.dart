import 'package:ecommerce_application/controller/cart_controller.dart';
import 'package:ecommerce_application/core/class/handlingdataview.dart';
import 'package:ecommerce_application/core/constant/color.dart';
import 'package:ecommerce_application/view/widget/cart/cart_bottom_navi_bar.dart';
import 'package:ecommerce_application/view/widget/cart/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    CartController cartController = Get.put(CartController());
    return Scaffold(
        backgroundColor: AppColor.backgroundcolor,
        appBar: AppBar(
          backgroundColor: AppColor.backgroundcolor,
          title: const Text(
            'MY CART',
            maxLines: 1,
            textAlign: TextAlign.start,
          ),
          elevation: 0,
          iconTheme: const IconThemeData(
            color: AppColor.primaryblueColor,
          ),
        ),
        body: GetBuilder<CartController>(
          builder: (controller) {
            return HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: ListView(
                  children: [
                    cartController.data.isEmpty
                        ? SizedBox(
                            height: Get.height / 2,
                            //color: Colors.red,
                            child: const Center(
                              child: Text(
                                'Your Cart is Empty :")',
                                style: TextStyle(
                                    fontSize: 30,
                                    color: AppColor.silverGreen,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              children: [
                                ...List.generate(
                                  cartController.data.length,
                                  (index) => CartItem(
                                    title:
                                        cartController.data[index].itemsName!,
                                    price: cartController
                                        .data[index].itemsprice!
                                        .toDouble(),
                                    count: cartController.data[index].countitems
                                        .toString(),
                                    image:
                                        cartController.data[index].itemsImage!,
                                    onAddPressed: () async {
                                      await cartController.add(
                                          cartController.data[index].itemsId!);
                                      cartController.refreshCartPage();
                                    },
                                    onRemovePressed: () async {
                                      await cartController.remove(
                                          cartController.data[index].itemsId!);
                                      cartController.refreshCartPage();
                                    },
                                  ),
                                )
                              ],
                            ),
                          )
                  ],
                ));
          },
        ),
        bottomNavigationBar: GetBuilder<CartController>(builder: (controller) {
          return CartBtmNaviBar(
            itemscount: cartController.totalitemscount.toString(),
            subtotal: cartController.priceorders,
            discount: cartController.discountCoupon.toString(),
            shipping: 100,
            onCouponApply: () {
              cartController.cheekCoupon();
            },
            couponcontroller: cartController.couponController,
            total: cartController.getTotalPrice(),
            onOrderPressed: () {
              //Get.toNamed(AppRoute.checkout);
              cartController.goToCheckoutPage();
            },
          );
        }));
  }
}
