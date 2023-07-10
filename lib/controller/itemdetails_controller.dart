import 'package:ecommerce_application/controller/cart_controller.dart';
import 'package:ecommerce_application/core/class/statusrequest.dart';
import 'package:ecommerce_application/data/model/itemsmodel.dart';
import 'package:get/get.dart';

abstract class ItemDetailsController extends GetxController {}

class ItemDetailsControllerImp extends ItemDetailsController {
  CartController cartController = Get.put(CartController());
  late ItemsModel itemsModel;
  late StatusRequest statusRequest;
  int itemsCount = 0;

  initailData() async {
    statusRequest = StatusRequest.loading;
    itemsModel = Get.arguments['itemsmodel'];
    itemsCount = await cartController.getItemsCount(itemsModel.itemsId!);
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
    cartController.add(itemsModel.itemsId!);
    itemsCount++;
    update();
  }

  removeCount() {
    if (itemsCount > 0) {
      cartController.remove(itemsModel.itemsId!);
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
