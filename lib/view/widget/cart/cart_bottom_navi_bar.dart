import 'package:ecommerce_application/controller/cart_controller.dart';
import 'package:ecommerce_application/view/widget/cart/bottom_cart_btn.dart';
import 'package:ecommerce_application/view/widget/cart/coupon_btn.dart';
import 'package:ecommerce_application/view/widget/cart/price_details.dart';
import 'package:get/get.dart';
import '../../../core/constant/color.dart';
import 'package:flutter/material.dart';

class CartBtmNaviBar extends StatelessWidget {
  final TextEditingController? couponcontroller;
  final void Function()? onCouponApply;
  final Function()? onOrderPressed;
  final String itemscount;
  final double subtotal;
  final String discount;
  final double shipping;
  final double total;
  const CartBtmNaviBar(
      {super.key,
      required this.onCouponApply,
      required this.onOrderPressed,
      required this.itemscount,
      required this.couponcontroller,
      required this.subtotal,
      required this.discount,
      required this.shipping,
      required this.total});

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
          const SizedBox(height: 10),
          GetBuilder<CartController>(builder: (c) {
            return c.couponCode == null
                ? Container(
                    //color: Colors.amber,
                    child: Row(
                      children: [
                        Expanded(
                            flex: 2,
                            child: TextFormField(
                              controller: couponcontroller,
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                              decoration: InputDecoration(
                                fillColor: AppColor.primaryblueColor,
                                hintText: 'Enter Coupon code here',
                                hintStyle: const TextStyle(
                                  color: Colors.black,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                /*border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              gapPadding: 6,
                            ),*/
                                isDense: true,
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10),
                              ),
                            )),
                        const SizedBox(width: 8),
                        Expanded(
                          flex: 1,
                          child: CouponBtn(
                            textbutton: 'APPLY',
                            textColor: Colors.black,
                            fontSize: 20,
                            buttonColor: AppColor.silverGreen,
                            onPressed: onCouponApply,
                          ),
                        )
                      ],
                    ),
                  )
                : SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Coupon code: '.toUpperCase(),
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontFamily: "arial",
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        Text(
                          c.couponCode!.toUpperCase(),
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontFamily: "arial",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  );
          }),
          itemsCount(),
          const Divider(height: .5, thickness: 2.2),
          PriceDetailsCard(
            price: subtotal,
            title: 'Sub total:',
          ),
          PriceDetailsCard(
            price: shipping,
            title: 'Shipping:',
          ),
          const Divider(height: .5, thickness: 2.2),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Discount:',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: "arial",
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  '% $discount',
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 10),
          const Divider(height: .5, thickness: 3.2, color: Colors.black54),
          PriceDetailsCard(
            price: total,
            color: AppColor.silverGreen,
            title: 'Total:',
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: CustomCartButton(
              textbutton: 'Finalize order',
              buttonColor: AppColor.silverGreen,
              textColor: AppColor.backgroundcolor,
              onPressed: onOrderPressed,
            ),
          )
        ],
      ),
    );
  }

  Padding itemsCount() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Items count:',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontFamily: "arial",
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            itemscount,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontFamily: "sans",
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
