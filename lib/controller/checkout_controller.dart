import 'package:ecommerce_application/core/class/statusrequest.dart';
import 'package:ecommerce_application/core/constant/color.dart';
import 'package:ecommerce_application/core/functions/handingdatacontroller.dart';
import 'package:ecommerce_application/core/services/services.dart';
import 'package:ecommerce_application/data/datasource/remote/address_data.dart';
import 'package:get/get.dart';
import '../core/constant/approutes.dart';
import '../data/datasource/remote/checkout_data.dart';
import '../data/model/address_model.dart';

class CheckoutController extends GetxController {
  AddressData addressData = Get.put(AddressData(Get.find()));
  CheckoutData checkoutData = Get.put(CheckoutData(Get.find()));
  MyServices myServices = Get.find();
  List<AddressModel> addressList = [];
  StatusRequest statusRequest = StatusRequest.none;
  int? paymentMethod;
  int? deliveryType;
  int addressid = 0;
  late int couponid;
  late double priceorders;
  late String coupondiscount;

  getShippingAddress() async {
    statusRequest = StatusRequest.loading;

    var response = await addressData
        .getData(myServices.sharedPreferences.getInt('id')!.toString());

    //print("=============================== Controller $response ");

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List data = response['data'];
        addressList.addAll(data.map((e) => AddressModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }

    update();
  }

  checkout() async {
    if (paymentMethod == null) {
      return Get.snackbar(
        "Error",
        "Please select a payment method",
        backgroundColor: AppColor.itemsColor,
        colorText: AppColor.red,
      );
    }
    if (deliveryType == null) {
      return Get.snackbar(
        "Error",
        "Please select a order Type",
        backgroundColor: AppColor.itemsColor,
        colorText: AppColor.red,
      );
    }

    statusRequest = StatusRequest.loading;

    update();

    Map data = {
      "usersid": myServices.sharedPreferences.getInt("id")!.toString(),
      "addressid": addressid.toString(),
      "orderstype": deliveryType.toString(),
      "pricedelivery": "700".toString(),
      "ordersprice": priceorders.toString(),
      "couponid": couponid.toString(),
      "coupondiscount": coupondiscount.toString(),
      "paymentmethod": paymentMethod.toString(),
    };

    var response = await checkoutData.checkout(data: data);

    print("=============================== Controller $response ");

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        Get.offAllNamed(AppRoute.homepage);
        Get.snackbar(
          "Success",
          "the order was successfully",
          backgroundColor: AppColor.silverGreen,
          colorText: AppColor.backgroundcolor,
        );
      } else {
        statusRequest = StatusRequest.none;
        Get.snackbar("Error", "try again", backgroundColor: AppColor.red);
      }
      // End
    }
    update();
  }

  chosePaymentMethod({required int val}) {
    paymentMethod = val;
    update();
  }

  choseDelivryType({required int val}) {
    deliveryType = val;
    update();
  }

  choseShipingAddress({required int val}) {
    addressid = val;
    update();
  }

  @override
  void onInit() {
    couponid = Get.arguments['couponid'];
    priceorders = Get.arguments['priceorder'];
    coupondiscount = Get.arguments['discountcoupon'].toString();
    getShippingAddress();
    super.onInit();
  }
}
