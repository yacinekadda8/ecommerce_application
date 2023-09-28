import 'package:ecommerce_application/data/datasource/remote/favorite_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../core/class/statusrequest.dart';
import '../core/functions/handingdatacontroller.dart';
import '../core/services/services.dart';

class FavoriteController extends GetxController {
  FavoriteData favoriteData = FavoriteData(Get.find());
  MyServices myServices = Get.find();
  late StatusRequest statusRequest;
  List data = [];
  Map isFavorite = {};

  // key => id items
  // value =? 1 or 0

  setFavorite(id, val) {
    isFavorite[id] = val;
    update();
  }

  addFavorite(String itemid) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.addFavotie(
        itemid, myServices.sharedPreferences.getString("id")!);
    ////print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.rawSnackbar(
          title: "GREAT",
          message: "This item in favorate list now",
          borderRadius: 15,
          margin: const EdgeInsets.all(15),
        );
        //data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
        Get.rawSnackbar(
          title: "SADLY",
          message:
              "The item has not been added to favourites, please try again",
          backgroundColor: const Color.fromARGB(255, 149, 11, 11),
          borderRadius: 15,
          margin: const EdgeInsets.all(15),
        );
      }
    }
  }

  removeFavorite(String itemid) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.removeFavotie(
        itemid, myServices.sharedPreferences.getString("id")!);
    ////print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        //data.addAll(response['data']);
        Get.rawSnackbar(
          title: "DONE",
          message: "This item has been deleted from favorate list now",
        );
      } else {
        statusRequest = StatusRequest.failure;
        Get.rawSnackbar(
          title: "SADLY",
          message:
              "The item has not been deleted from favourites, please try again",
          backgroundColor: const Color.fromARGB(255, 149, 11, 11),
          borderRadius: 15,
          margin: const EdgeInsets.all(15),
        );
      }
    }
  }
}
