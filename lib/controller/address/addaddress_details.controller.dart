// ignore_for_file: avoid_print

import 'package:ecommerce_application/core/constant/approutes.dart';
import 'package:ecommerce_application/core/services/services.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/functions/handingdatacontroller.dart';
import '../../data/datasource/remote/address_data.dart';

class AddAddressDetailsController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;

  TextEditingController? name;
  TextEditingController? city;
  TextEditingController? street;
  TextEditingController? phone;

  String? lat;
  String? long;

  AddressData adressData = AddressData(Get.find());
  MyServices myServices = Get.find();

  initialData() {
    name = TextEditingController();
    city = TextEditingController();
    street = TextEditingController();
    phone = TextEditingController();
    lat = Get.arguments['lat'];
    long = Get.arguments['long'];
    if (kDebugMode) {
      print('--- latitude: $lat');
      print('--- longitude: $long');
    }
  }

  addAdress() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await adressData.addData(
      myServices.sharedPreferences.getInt("id")!.toString(),
      name!.text,
      city!.text,
      street!.text,
      lat!,
      long!,
      phone!.text,
    );
    print("=============================== Controller $response ");

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.offAndToNamed(AppRoute.homepage);
        Get.rawSnackbar(
          title: "GREAT",
          message: "You can send to this Address now.",
          borderRadius: 15,
          margin: const EdgeInsets.all(15),
          duration: const Duration(seconds: 6),
        );
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void dispose() {
    name?.dispose();
    city?.dispose();
    street?.dispose();
    phone?.dispose();
    super.dispose();
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }
}
