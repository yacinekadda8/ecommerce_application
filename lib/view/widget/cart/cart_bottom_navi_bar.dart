import 'package:ecommerce_application/view/widget/cart/bottom_cart_btn.dart';
import 'package:ecommerce_application/view/widget/cart/price_details.dart';
import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CartBtmNaviBar extends StatelessWidget {
  const CartBtmNaviBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2),
      decoration: const BoxDecoration(
          color: AppColor.primaryblueColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.0),
            topRight: Radius.circular(25.0),
          )),
      //width: Get.width / 2,
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const PriceDetailsCard(
            price: '2',
            title: 'Items count:',
          ),
          const Divider(height: .5, thickness: 2.2),
          const PriceDetailsCard(
            price: '300.00',
            title: 'Sub total:',
          ),
          const Divider(height: .5, thickness: 2.2),
          const PriceDetailsCard(
            price: '30.00',
            title: 'Shiping:',
          ),
          const Divider(height: .5, thickness: 3.2, color: Colors.black54),
          const PriceDetailsCard(
            price: '330.00',
            color: AppColor.silverGreen,
            title: 'Total:',
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: CustomCartButton(
              textbutton: 'Finalize order',
              buttonColor: AppColor.silverGreen,
              textColor: AppColor.backgroundcolor,
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
