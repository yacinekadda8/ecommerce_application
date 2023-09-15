import 'package:ecommerce_application/core/class/statusrequest.dart';
import 'package:ecommerce_application/core/functions/handingdatacontroller.dart';
import 'package:ecommerce_application/core/services/services.dart';
import 'package:ecommerce_application/data/datasource/remote/address_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/constant/routes.dart';
import '../data/model/address_model.dart';

class CheckoutController extends GetxController {
  AddressData addressData = Get.put(AddressData(Get.find()));
  MyServices myServices = Get.find();
  List<AddressModel> addressList = [];

  StatusRequest statusRequest = StatusRequest.none;
  String? paymentMethod;
  String? delivryType;
  String? addressId;

  getShippingAddress() async {
    statusRequest = StatusRequest.loading;

    var response = await addressData
        .getData(myServices.sharedPreferences.getString('id')!);

    //print("=============================== Controller $response ");

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List data = response['data'];
        addressList.addAll(data.map((e) => AddressModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }

    update();
  }

  chosePaymentMethod(String val) {
    paymentMethod = val;
    update();
  }

  choseDelivryType(String val) {
    delivryType = val;
    update();
  }

  choseShipingAddress(String val) {
    addressId = val;
    update();
  }


  //   ----------- Test --------------- // 
/*
   addAdress() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await adressData.addData(
      myServices.sharedPreferences.getString("id")!,
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
*/






  @override
  void onInit() {
    getShippingAddress();
    super.onInit();
  }
}
