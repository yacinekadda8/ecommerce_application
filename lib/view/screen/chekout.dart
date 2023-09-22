import 'package:dartz/dartz.dart';
import 'package:ecommerce_application/controller/checkout_controller.dart';
import 'package:ecommerce_application/core/class/handlingdataview.dart';
import 'package:ecommerce_application/core/constant/color.dart';
import 'package:ecommerce_application/view/widget/checkout/delivery_type.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/cart/bottom_cart_btn.dart';
import '../widget/checkout/ask_widget.dart';
import '../widget/checkout/delivery_address_card.dart';
import '../widget/checkout/payment_method.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    CheckoutController controller = Get.put(CheckoutController());
    return Scaffold(
      //backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Chekout'),
      ),
      body: GetBuilder<CheckoutController>(builder: (c) {
        return HandlingDataView(
          statusRequest: c.statusRequest,
          widget: SizedBox(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: ListView(
                children: [
                  const AskWidget(qstion: 'Choose Payment Method'),
                  InkWell(
                    onTap: () {
                      c.chosePaymentMethod('card');
                    },
                    child: PaymentMethod(
                      title: 'Credit Card',
                      isActive: c.paymentMethod == "card" ? true : false,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      c.chosePaymentMethod('cash');
                    },
                    child: PaymentMethod(
                      title: 'Cash On Delivery',
                      isActive: c.paymentMethod == "cash" ? true : false,
                    ),
                  ),
                  const AskWidget(qstion: 'Choose Delivery Type'),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          c.choseDelivryType('store');
                        },
                        child: DeliveryType(
                          title: 'Store',
                          isActive: c.delivryType == 'store' ? true : false,
                          icon: Icons.storefront_sharp,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          c.choseDelivryType('delivery');
                        },
                        child: DeliveryType(
                          title: 'Delivery',
                          isActive: c.delivryType == 'delivery' ? true : false,
                          icon: Icons.delivery_dining,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  if (c.delivryType == 'delivery')
                    SizedBox(
                      width: 400,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const AskWidget(qstion: 'Choose Shipping Address'),
                          const SizedBox(height: 10),
                          ...List.generate(
                              c.addressList.length,
                              (index) => InkWell(
                                    onTap: () {
                                      c.choseShipingAddress(c
                                          .addressList[index].addressId
                                          .toString());
                                    },
                                    child: DeliveryAddressCard(
                                      title: c.addressList[index].addressName
                                          .toString(),
                                      subtitle: c
                                          .addressList[index].addressStreet
                                          .toString(),
                                      isActive: c.addressId ==
                                              c.addressList[index].addressId
                                                  .toString()
                                          ? true
                                          : false,
                                    ),
                                  ))
                        ],
                      ),
                    )
                ],
              ),
            ),
          ),
        );
      }),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
        decoration: BoxDecoration(
          color: AppColor.primaryblueColor,
          borderRadius: BorderRadius.circular(15),
        ),
        width: double.infinity,
        child: MaterialButton(
          //color: AppColor.silverGreen,
          height: 50,
          textColor: AppColor.backgroundcolor,
          onPressed: () {},
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.0),
          ),
          child: const Text("Checkout",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 26,
                fontFamily: "arial",
              )),
        ),
      ),
    );
  }
}
