import 'package:ecommerce_application/data/model/itemsmodel.dart';
import 'package:get/get.dart';

abstract class ItemDetailsController extends GetxController {}

class ItemDetailsControllerImp extends ItemDetailsController {
  late ItemsModel itemsModel;

  initailData() {
    itemsModel = Get.arguments['itemsmodel'];
  }

  @override
  void onInit() {
    initailData();
    super.onInit();
  }
}
