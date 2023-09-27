// ignore_for_file: avoid_print

import 'package:ecommerce_application/data/datasource/remote/address_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/functions/handingdatacontroller.dart';
import '../../core/services/services.dart';
import '../../data/model/address_model.dart';

class AddressViewController extends GetxController {
  AddressData addressData = AddressData(Get.find());

  List<AddressModel> addressList = []; //

  late StatusRequest statusRequest;
  MyServices myServices = Get.find();

  getData() async {
    statusRequest = StatusRequest.loading;

    var response = await addressData
        .getData(myServices.sharedPreferences.getInt('id')!.toString());

    print("=============================== Controller $response ");

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List listData = response['data'];
        addressList.addAll(listData.map((e) => AddressModel.fromJson(e)));
        if (addressList.isEmpty) {
          statusRequest = StatusRequest.failure;
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }

    update();
  }

  removeAddress(int addressId) {
    Get.defaultDialog(
      title: 'Remove the Address',
      textCancel: 'Cancel',
      content: const Text('if you pressed "Yes" the Address will Deleted.'),
      onCancel: () {
        Get.back();
      },
      textConfirm: "Yes",
      onConfirm: () {
        addressData.removeData(addressId.toString());
        addressList.removeWhere(
            (element) => element.addressId == addressId);
        update();
        Get.back();
      },
    );
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
