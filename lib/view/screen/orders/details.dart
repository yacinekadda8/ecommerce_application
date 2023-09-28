// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';

import '../../../controller/orders/details_controller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/constant/color.dart';

class OrdersDetails extends StatelessWidget {
  const OrdersDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersDetailsController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders Details'),
      ),
      body: SizedBox(
        //padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
        child: GetBuilder<OrdersDetailsController>(
            builder: ((controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: ListView(children: [
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Column(
                        children: [
                          Table(
                            children: [
                              TableRow(children: [
                                Text("Item",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: AppColor.primaryblueColor,
                                        fontWeight: FontWeight.bold)),
                                Text("QTY",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: AppColor.primaryblueColor,
                                        fontWeight: FontWeight.bold)),
                                Text("Price",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: AppColor.primaryblueColor,
                                        fontWeight: FontWeight.bold)),
                              ]),
                              // TableRow(children: [
                              //   Text("Macbook m1", textAlign: TextAlign.center),
                              //   Text("2", textAlign: TextAlign.center),
                              //   Text("1200", textAlign: TextAlign.center),
                              // ]),
                              ...List.generate(
                                  controller.data.length,
                                  (index) => TableRow(children: [
                                        Text(
                                            "${controller.data[index].itemsName}",
                                            textAlign: TextAlign.center),
                                        Text(
                                            "${controller.data[index].countitems}",
                                            textAlign: TextAlign.center),
                                        Text(
                                            "${controller.data[index].itemsprice}",
                                            textAlign: TextAlign.center),
                                      ]))
                            ],
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 14.0),
                            child: OrderPriceInfo(),
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (controller.ordersModel.ordersDeliverytype == 0)
                    Card(
                      child: SizedBox(
                          child: ListTile(
                        title: const Text("Shipping Address",
                            style: TextStyle(
                                color: AppColor.primaryblueColor,
                                fontWeight: FontWeight.bold)),
                        subtitle: Text(
                            "${controller.ordersModel.addressCity} ${controller.ordersModel.addressStreet}"),
                      )),
                    ),
                  if (controller.ordersModel.ordersDeliverytype == 0)
                    Card(
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                        height: 300,
                        width: double.infinity,
                        child: GoogleMap(
                          mapType: MapType.normal,
                          markers: controller.markers.toSet(),
                          initialCameraPosition: controller.cameraPosition!,
                          onMapCreated: (GoogleMapController controllermap) {
                            controller.completercontroller!
                                .complete(controllermap);
                          },
                        ),
                      ),
                    )
                ])))),
      ),
    );
  }
}

class OrderPriceInfo extends StatelessWidget {
  const OrderPriceInfo({super.key});

  @override
  Widget build(BuildContext context) {
    OrdersDetailsController controller = Get.put(OrdersDetailsController());
    var discountPrice = controller.ordersModel.ordersTotalPrice! -
        controller.ordersModel.ordersPrice!;
    return Column(
      children: [
        Divider(color: AppColor.primaryblueColor),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Dlivery Price : ",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 18,
                    color: AppColor.primaryblueColor,
                    fontWeight: FontWeight.bold)),
            Text(
                NumberFormat.currency(locale: 'ar_DZ', decimalDigits: 2)
                    .format(controller.ordersModel.ordersPricedelivery),
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 18,
                    color: AppColor.silverGreen,
                    fontWeight: FontWeight.bold)),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Old price : ",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 18,
                    color: AppColor.primaryblueColor,
                    fontWeight: FontWeight.bold)),
            Text(
                NumberFormat.currency(locale: 'ar_DZ', decimalDigits: 2)
                    .format(controller.ordersModel.ordersPrice),
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 18,
                    color: AppColor.silverGreen,
                    fontWeight: FontWeight.bold)),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Discount Price : ",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 18,
                    color: AppColor.primaryblueColor,
                    fontWeight: FontWeight.bold)),
            Text(
                NumberFormat.currency(locale: 'ar_DZ', decimalDigits: 2)
                    .format(discountPrice),
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 18,
                    color: AppColor.silverGreen,
                    fontWeight: FontWeight.bold)),
          ],
        ),
        SizedBox(height: 10),
        Divider(color: AppColor.primaryblueColor),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Total Price : ",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20,
                    color: AppColor.primaryblueColor,
                    fontWeight: FontWeight.bold)),
            Text(
                NumberFormat.currency(locale: 'ar_DZ', decimalDigits: 2)
                    .format(controller.ordersModel.ordersTotalPrice),
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20,
                    color: AppColor.silverGreen,
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ],
    );
  }
}
