// ignore_for_file: avoid_print

import 'package:ecommerce_application/core/class/statusrequest.dart';
import 'package:ecommerce_application/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/functions/handingdatacontroller.dart';
import '../core/services/services.dart';
import '../data/datasource/remote/cart_data.dart';

abstract class ItemDetailsController extends GetxController {}

class ItemDetailsControllerImp extends ItemDetailsController {
  //CartController cartController = Get.put(CartController());
  late ItemsModel itemsModel;
  late StatusRequest statusRequest;
  CartData cartData = CartData(Get.find());
  MyServices myServices = Get.find();

  int itemsCount = 0;

  add(int itemid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.addCart(
        itemid, myServices.sharedPreferences.getString("id")!);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        /*
        Get.rawSnackbar(
          title: "GREAT",
          message: "This item in Cart list now",
          borderRadius: 15,
          margin: const EdgeInsets.all(15),
        );*/
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
      update();
    }
  }

  remove(int itemid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.removeCart(
        itemid, myServices.sharedPreferences.getString("id")!);
    //print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        /*
        Get.rawSnackbar(
          title: "DONE",
          message: "The item deleted from Cart",
          borderRadius: 15,
          margin: const EdgeInsets.all(15),
        );*/
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
    update();
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
        print("================$itemsCount");

        return itemsCount;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  initailData() async {
    statusRequest = StatusRequest.loading;
    itemsModel = Get.arguments['itemsmodel'];
    itemsCount = await getItemsCount(itemsModel.itemsId!);
    statusRequest = StatusRequest.success;
    update();
  }

  List subitems = [
    {"name": "red", "id": 1, "active": "0"},
    {"name": "yellow", "id": 2, "active": "0"},
    {"name": "white", "id": 3, "active": "1"},
    {"name": "black", "id": 4, "active": "0"},
  ];
  addCount() {
    add(itemsModel.itemsId!);
    itemsCount++;
    update();
  }

  removeCount() {
    if (itemsCount > 0) {
      remove(itemsModel.itemsId!);
      itemsCount--;
      update();
    }
  }

  @override
  void onInit() {
    initailData();
    super.onInit();
  }
}
