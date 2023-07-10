import 'package:ecommerce_application/core/class/statusrequest.dart';
import 'package:ecommerce_application/core/functions/handingdatacontroller.dart';
import 'package:ecommerce_application/core/services/services.dart';
import 'package:ecommerce_application/data/datasource/remote/cart_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  CartData cartData = CartData(Get.find());
  MyServices myServices = Get.find();
  late StatusRequest statusRequest;

  add(int itemid) async {
    statusRequest = StatusRequest.loading;
    var response = await cartData.addCart(
        itemid, myServices.sharedPreferences.getString("id")!);
    //print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        update();
        Get.rawSnackbar(
          title: "GREAT",
          message: "This item in Cart list now",
          borderRadius: 15,
          margin: const EdgeInsets.all(15),
        );
        //data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
        Get.rawSnackbar(
          title: "SADLY",
          message: "The item has not added to Cart, please try again",
          backgroundColor: const Color.fromARGB(255, 149, 11, 11),
          borderRadius: 15,
          margin: const EdgeInsets.all(15),
        );
      }
    }
  }

  remove(int itemid) async {
    statusRequest = StatusRequest.loading;
    var response = await cartData.removeCart(
        itemid, myServices.sharedPreferences.getString("id")!);
    //print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        update();
        Get.rawSnackbar(
          title: "DONE",
          message: "The item deleted from Cart",
          borderRadius: 15,
          margin: const EdgeInsets.all(15),
        );
        //data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
        Get.rawSnackbar(
          title: "SADLY",
          message: "The item has not been deleted from Cart",
          backgroundColor: const Color.fromARGB(255, 149, 11, 11),
          borderRadius: 15,
          margin: const EdgeInsets.all(15),
        );
      }
    }
  }

  getItemsCount(int itemid) async {
    statusRequest = StatusRequest.loading;
    var response = await cartData.itemsCardCount(
        itemid, myServices.sharedPreferences.getString("id")!);
    //print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        int itemsCount = 0;
        itemsCount = response['data'];
        // ignore: avoid_print
        print("================$itemsCount");
        return itemsCount;
        
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  view() {}
}
