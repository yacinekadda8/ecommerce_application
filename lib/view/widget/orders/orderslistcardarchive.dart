import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';

import '../../../controller/orders/archive_controller.dart';
import '../../../core/constant/approutes.dart';
import '../../../core/constant/color.dart';
import '../../../data/model/orders_model.dart';

class CardOrdersListArchive extends GetView<OrdersArchiveController> {
  final OrdersModel listdata;

  const CardOrdersListArchive({Key? key, required this.listdata})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text("Order Number : ",
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColor.white)),
                  Text("#${listdata.ordersId}",
                      style: const TextStyle(
                          fontFamily: "arail",
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColor.silverGreen)),
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
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Total Price : ",
                          style: const TextStyle(
                              fontSize: 22,
                              height: 1.6,
                              color: AppColor.white,
                              fontWeight: FontWeight.bold)),
                      Text(
                          NumberFormat.currency(
                                  locale: 'ar_DZ', decimalDigits: 2)
                              .format(listdata.ordersTotalPrice),
                          style: const TextStyle(
                              color: AppColor.silverGreen,
                              fontFamily: "arial",
                              fontSize: 22,
                              // height: 1.9,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                  //const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      MaterialButton(
                        onPressed: () {
                          Get.toNamed(AppRoute.ordersdetails,
                              arguments: {"ordersmodel": listdata});
                        },
                        color: AppColor.red,
                        textColor: AppColor.black,
                        child: const Text(
                          "Details",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
