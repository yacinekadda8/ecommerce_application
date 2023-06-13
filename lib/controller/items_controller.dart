import 'package:get/get.dart';

import '../core/class/statusrequest.dart';
import '../core/functions/handingdatacontroller.dart';
import '../data/datasource/remote/items_data.dart';

abstract class ItemsController extends GetxController {
  intialData();
  changeCat(int val, String catval);
  getItems(categoryid);
}

class ItemsControllerImp extends ItemsController {
  ItemsData itemsData = ItemsData(Get.find());
  late StatusRequest statusRequest;
  List data = [];
  List categories = [];
  int? selectedCat;
  String? catid;
  @override
  void onInit() {
    intialData();
    super.onInit();
  }

  @override
  intialData() {
    catid = Get.arguments['categoryid'];
    categories = Get.arguments['categories'];
    selectedCat = Get.arguments['selectedcat'];
    getItems(catid!);
  }

  @override
  changeCat(val, catval) {
    selectedCat = val;
    catid = catval;
    getItems(catid!);
    update();
  }

  @override
  getItems(categoryid) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await itemsData.getData(categoryid);
    //print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
