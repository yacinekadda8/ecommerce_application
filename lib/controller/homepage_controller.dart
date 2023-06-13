import 'package:ecommerce_application/core/class/statusrequest.dart';
import 'package:ecommerce_application/core/constant/routes.dart';
import 'package:ecommerce_application/core/functions/handingdatacontroller.dart';
import 'package:ecommerce_application/core/services/services.dart';
import 'package:ecommerce_application/data/datasource/remote/home_data.dart';
import 'package:get/get.dart';

abstract class HomepageController extends GetxController {
  initialdata();
  getData();
  goToItems(List catrgories, int selectedCat,String categoryid);
}

class HomeControllerImp extends HomepageController {
  MyServices myServices = Get.find();
  String? username;
  String? id;

  HomeData homeData = HomeData(Get.find());
  late StatusRequest statusRequest;
  //List data = [];
  List categories = [];
  List items = [];

  @override
  void onInit() {
    getData();
    initialdata();
    super.onInit();
  }

  @override
  void initialdata() {
    username = myServices.sharedPreferences.getString("username");
    id = myServices.sharedPreferences.getString("id");
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.getData();
    // ignore: avoid_print
    print("=============================== Controller $response ");
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
  goToItems( catrgories, selectedCat,categoryid) {
    Get.toNamed(AppRoute.items,arguments: {
      "categories" : categories,
      "selectedcat": selectedCat,
      "categoryid": categoryid,
    });
  }
}
