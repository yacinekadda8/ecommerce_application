import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ecommerce_application/core/class/handlingdataview.dart';
import 'package:ecommerce_application/core/constant/color.dart';
import 'package:ecommerce_application/core/constant/approutes.dart';
import 'package:ecommerce_application/data/model/address_model.dart';

import '../../controller/address/address_view_controller.dart';

class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
 Get.put(AddressViewController());
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Manage Your Address',
        ),
      ),
      body: GetBuilder<AddressViewController>(
          builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: ListView.builder(
                  itemCount: controller.addressList.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return AddressCard(
                      addressModel: controller.addressList[index],
                      onLongPress: () {
                        controller.removeAddress(
                            controller.addressList[index].addressId!);
                      },
                    );
                  }))),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoute.addressAdd);
        },
        child: const Icon(
          Icons.add,
          size: 40,
        ),
      ),
    );
  }
}

class AddressCard extends StatelessWidget {
  final AddressModel addressModel;
  final void Function()? onLongPress;
  const AddressCard({
    Key? key,
    required this.addressModel,
    required this.onLongPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: onLongPress,
      child: Container(
        padding: const EdgeInsets.only(bottom: 12, left: 10, right: 10),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColor.backgroundcolor,
          border: Border.all(
            color: AppColor.primaryblueColor, // Border color
            width: 2.0, // Border width
          ),
          borderRadius: BorderRadius.circular(20.0), // Border radius
        ),
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('${addressModel.addressName}',
                style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: AppColor.primaryblueColor)),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  'City: ',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColor.primaryblueColor),
                ),
                Text('${addressModel.addressCity}',
                    style: const TextStyle(
                        fontSize: 24, color: AppColor.silverGreen)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  'Street: ',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColor.primaryblueColor),
                ),
                Text('${addressModel.addressStreet}',
                    style: const TextStyle(
                        fontSize: 24, color: AppColor.silverGreen)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  'Phone: ',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColor.primaryblueColor),
                ),
                Text('${addressModel.addressUsersphone}',
                    style: const TextStyle(
                        fontSize: 24, color: AppColor.silverGreen)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
