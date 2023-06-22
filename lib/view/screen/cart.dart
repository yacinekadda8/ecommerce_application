import 'package:ecommerce_application/core/constant/color.dart';
import 'package:ecommerce_application/view/widget/cart/cart_app_bar.dart';
import 'package:ecommerce_application/view/widget/cart/cart_bottom_navi_bar.dart';
import 'package:ecommerce_application/view/widget/cart/cart_item.dart';
import 'package:flutter/material.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundcolor,
      bottomNavigationBar: const CartBtmNaviBar(),
      body: ListView(
        children: const [
          CartAppBAr(),
          Padding(
            padding: EdgeInsets.all(12.0),
            child: Column(
              children: [
                CartItem(),
                CartItem(),
                CartItem(),
                CartItem(),
                CartItem(),
                CartItem(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
