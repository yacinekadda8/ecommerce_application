import 'package:ecommerce_application/core/class/statusrequest.dart';
import 'package:ecommerce_application/core/constant/approutes.dart';
import 'package:ecommerce_application/core/functions/handingdatacontroller.dart';
import 'package:ecommerce_application/core/services/services.dart';
import 'package:ecommerce_application/data/datasource/remote/home_data.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/model/itemsmodel.dart';

abstract class HomeController extends GetxController {
  initialdata();
  getData();
  goToItems(List catrgories, int selectedCat, String categoryid);
  goToItemsDetailsScreen(ItemsModel itemsModel);
  goToMyfavorites(ItemsModel itemsModel);
}

class HomeControllerImp extends SearchMixController {
  MyServices myServices = Get.find();
  //List<ItemsModel> listSearchDataModel = [];
  String? username;
  String? id;
  String? lang;
  //TextEditingController? textSearchController;
  //bool isSearch = false;

  //HomeData homeData = HomeData(Get.find());
  //late StatusRequest statusRequest;
  //List data = [];
  List categories = [];
  List items = [];
  List settingsData = [];

  goToItemsDetailsScreen(itemsModel) {
    Get.toNamed("itemdetails", arguments: {"itemsmodel": itemsModel});
  }

  @override
  void onInit() {
    // FirebaseMessaging.instance.getToken().then((value) {
    //   String? token = value;
    //   print("token: $token");
    // });
    getData();
    initialdata();
    textSearchController = TextEditingController();

    super.onInit();
  }

  void initialdata() {
    username = myServices.sharedPreferences.getString("username");
    id = myServices.sharedPreferences.getString("id");
    lang = myServices.sharedPreferences.getString("lang");
  }

  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.getData();
    //print("response:  $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        categories.addAll(response['categories']['data']);
        items.addAll(response['items']['data']);
        settingsData.addAll(response['settings']['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  goToItems(catrgories, selectedCat, categoryid) {
    Get.toNamed(AppRoute.items, arguments: {
      "categories": categories,
      "selectedcat": selectedCat,
      "categoryid": categoryid,
    });
  }

  goToMyfavorites(itemsModel) {
    Get.toNamed("myfavorites", arguments: {
      "itemsmodel": itemsModel,
    });
  }
}

class SearchMixController extends GetxController {
  HomeData homeData = HomeData(Get.find());
  late StatusRequest statusRequest;

  TextEditingController? textSearchController;
  bool isSearch = false;

  List<ItemsModel> listSearchDataModel = [];

  search() async {
    if (textSearchController!.text.isNotEmpty) {
      statusRequest = StatusRequest.loading;
      var response = await homeData.searchData(textSearchController!.text);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          listSearchDataModel.clear();
          List responseData = response['data'];
          listSearchDataModel
              .addAll(responseData.map((e) => ItemsModel.fromJson(e)));
        } else {
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }

  clearSearch() {
    textSearchController!.clear();
    listSearchDataModel.clear();
    statusRequest = StatusRequest.none;
    isSearch = false;
    update();
  }

  checkSearch(value) {
    if (value == "") {
      statusRequest = StatusRequest.none;
      isSearch = false;
    }
    update();
  }

  onSearchItems() {
    search();
    isSearch = true;
    update();
  }
}
