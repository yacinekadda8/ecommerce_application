import 'package:ecommerce_application/data/model/itemsmodel.dart';
import 'package:get/get.dart';

abstract class ItemDetailsController extends GetxController {}

class ItemDetailsControllerImp extends ItemDetailsController {
  late ItemsModel itemsModel;

  initailData() {
    itemsModel = Get.arguments['itemsmodel'];
  }

  List subitems = [
    {"name": "red", "id": 1, "active": "0"},
    {"name": "yellow", "id": 2, "active": "0"},
    {"name": "white", "id": 3, "active": "1"},
    {"name": "black", "id": 4, "active": "0"},
  ];

  @override
  void onInit() {
    initailData();
    super.onInit();
  }
}
