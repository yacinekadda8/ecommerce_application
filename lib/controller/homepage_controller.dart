import 'package:ecommerce_application/core/class/statusrequest.dart';
import 'package:ecommerce_application/core/constant/routes.dart';
import 'package:ecommerce_application/core/functions/handingdatacontroller.dart';
import 'package:ecommerce_application/core/services/services.dart';
import 'package:ecommerce_application/data/datasource/remote/home_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/model/itemsmodel.dart';

abstract class HomepageController extends GetxController {
  initialdata();
  getData();
  goToItems(List catrgories, int selectedCat, String categoryid);
  goToItemsDetailsScreen(ItemsModel itemsModel);
  goToMyfavorites(ItemsModel itemsModel);
}

class HomeControllerImp extends SearchMixController {
  MyServices myServices = Get.find();
  List<ItemsModel> listSearchDataModel = [];
  String? username;
  String? id;
  String? lang;
  TextEditingController? textSearchController;
  bool isSearch = false;

  HomeData homeData = HomeData(Get.find());
  late StatusRequest statusRequest;
  //List data = [];
  List categories = [];
  List items = [];



  @override
  goToItemsDetailsScreen(itemsModel) {
    Get.toNamed("itemdetails", arguments: {
      "itemsmodel": itemsModel,
    });
  }



  @override
  void onInit() {
    getData();
    initialdata();
    textSearchController = TextEditingController();

    super.onInit();
  }

  @override
  void initialdata() {
    username = myServices.sharedPreferences.getString("username");
    id = myServices.sharedPreferences.getString("id");
    lang = myServices.sharedPreferences.getString("lang");
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.getData();
    //print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        categories.addAll(response['categories']);
        items.addAll(response['items']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }



  @override
  goToItems(catrgories, selectedCat, categoryid) {
    Get.toNamed(AppRoute.items, arguments: {
      "categories": categories,
      "selectedcat": selectedCat,
      "categoryid": categoryid,
    });
  }



  @override
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

    checkSearch(value) {
    if (value == "") {
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