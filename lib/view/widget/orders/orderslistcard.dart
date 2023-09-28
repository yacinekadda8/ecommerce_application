import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';

import '../../../controller/orders/pending_controller.dart';
import '../../../core/constant/approutes.dart';
import '../../../core/constant/color.dart';
import '../../../data/model/orders_model.dart';

class CardOrdersList extends GetView<OrdersPendingController> {
  final OrdersModel listdata;
  const CardOrdersList({Key? key, required this.listdata}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColor.itemsColor,
      child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text("Order Number: ",
                      style: TextStyle(
                          color: AppColor.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                  Text("${listdata.ordersId}",
                      style: const TextStyle(
                          color: AppColor.silverGreen,
                          fontSize: 22,
                          height: 1.4,
                          fontWeight: FontWeight.bold)),
                  const Spacer(),
                  // Text(listdata.ordersDatetime!)
                  Text(
                    Jiffy(listdata.ordersDatetime!, "yyyy-MM-dd").fromNow(),
                    style: const TextStyle(
                        color: AppColor.primaryblueColor,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              const Divider(),
              Text(
                  "Order Type : ${controller.printOrderType(listdata.ordersDeliverytype!.toString())}"),
              Text("Order Price : ${listdata.ordersPrice} \$"),
              Text("Delivery Price : ${listdata.ordersPricedelivery} \$ "),
              Text(
                  "Payment Method : ${controller.printPaymentMethod(listdata.ordersPaymentmethod!.toString())} "),
              Text(
                  "Order Status : ${controller.printOrderStatus(listdata.ordersStatus!.toString())} "),
              const Divider(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Total Price:  ",
                      style: TextStyle(
                          color: AppColor.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  Text(
                      NumberFormat.currency(locale: 'ar_DZ', decimalDigits: 2)
                          .format(listdata.ordersTotalPrice),
                      style: const TextStyle(
                          color: AppColor.silverGreen,
                          fontSize: 22,
                          fontFamily: "arial",
                          // height: 1.5,
                          fontWeight: FontWeight.bold)),
                  const Spacer(),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  MaterialButton(
                    onPressed: () {
                      Get.toNamed(AppRoute.ordersdetails,
                          arguments: {"ordersmodel": listdata});
                    },
                    color: AppColor.primaryblueColor,
                    textColor: AppColor.black,
                    child: const Text("Details",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(width: 10),
                  if (listdata.ordersStatus! == 0)
                    MaterialButton(
                      onPressed: () {
                        controller.deleteOrder(listdata.ordersId!.toString());
                      },
                      color: AppColor.red,
                      textColor: AppColor.black,
                      child: const Text("Remove",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    )
                ],
              )
            ],
          )),
    );
  }
}
