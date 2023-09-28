// ignore_for_file:

import 'package:ecommerce_application/core/class/statusrequest.dart';
import 'package:ecommerce_application/core/functions/handingdatacontroller.dart';
import 'package:ecommerce_application/data/model/notification_model.dart';
import 'package:get/get.dart';

import '../core/services/services.dart';
import '../data/datasource/remote/notification_data.dart';

class NotificationController extends GetxController {
  NotificationData notificationData = NotificationData(Get.find());
  //List data = [];
  List<NotificationModel> data = [];
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();

    getnotification() async {
    statusRequest = StatusRequest.loading;
    var response = await notificationData.getData(myServices.sharedPreferences.getString("id")!);
    print("=============================== Offers_Controller $response ");
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        //data.addAll(response['data']);
        List listdata = response['data'];
        data.addAll(listdata.map((e) => NotificationModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  // getData() async {
  //   statusRequest = StatusRequest.loading;

  //   var response = await notificationData.getData();

  //   ////print("=============================== Controller $response ");

  //   statusRequest = handlingData(response);

  //   if (StatusRequest.success == statusRequest) {
  //     if (response['status'] == "success") {
  //       data.addAll(response['data']);
  //     } else {
  //       statusRequest = StatusRequest.failure;
  //     }
  //   }

  //   update();
  // }

  @override
  void onInit() {
    getnotification();
    super.onInit();
  }
}
