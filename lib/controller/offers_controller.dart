import 'package:ecommerce_application/controller/homepage_controller.dart';
import 'package:ecommerce_application/core/class/statusrequest.dart';
import 'package:ecommerce_application/core/functions/handingdatacontroller.dart';
import 'package:ecommerce_application/data/datasource/remote/offers_data.dart';
import 'package:ecommerce_application/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OffersController extends SearchMixController {
  OffersData offersData = OffersData(Get.find());

  List<ItemsModel> data = [];


  //late StatusRequest statusRequest;

    goToItemsDetailsScreen(itemsModel) {
    Get.toNamed("itemdetails", arguments: {
      "itemsmodel": itemsModel,
    });
  }

  getOffers() async {
    statusRequest = StatusRequest.loading;

    var response = await offersData.getData();

    //print("=============================== Offers_Controller $response ");
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        //data.addAll(response['data']);
        List listdata = response['data'];
        data.addAll(listdata.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    textSearchController = TextEditingController();
    getOffers();
    super.onInit();
  }
}
