import 'package:ecommerce_application/core/class/statusrequest.dart';
import 'package:ecommerce_application/core/constant/color.dart';
import 'package:ecommerce_application/core/functions/handingdatacontroller.dart';
import 'package:ecommerce_application/core/services/services.dart';
import 'package:ecommerce_application/data/datasource/remote/cart_data.dart';
import 'package:ecommerce_application/data/model/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/constant/approutes.dart';
import '../data/model/coupon_model.dart';

class CartController extends GetxController {
  late TextEditingController couponController;
  CartData cartData = CartData(Get.find());
  MyServices myServices = Get.find();
  late StatusRequest statusRequest;
  List<CartModel> data = [];
  int totalitemscount = 0;
  double priceorders = 0.0;
  CouponModel? couponModel;

  int? discountCoupon = 0;
  String? couponCode;
  int? couponId;

  add(int itemid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.addCart(
        itemid, myServices.sharedPreferences.getInt("id")!);
    //print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.rawSnackbar(
          title: "GREAT",
          message: "You can send to this Address now.",
          borderRadius: 15,
          margin: const EdgeInsets.all(15),
        );
        //data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
        Get.rawSnackbar(
          title: "SADLY",
          message: "The item has not added to Cart, please try again",
          backgroundColor: const Color.fromARGB(255, 149, 11, 11),
          borderRadius: 15,
          margin: const EdgeInsets.all(15),
        );
      }
      update();
    }
  }

  remove(int itemid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.removeCart(
        itemid, myServices.sharedPreferences.getInt("id")!);
    //print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        /*
        Get.rawSnackbar(
          title: "DONE",
          message: "The item deleted from Cart",
          borderRadius: 15,
          margin: const EdgeInsets.all(15),
        );*/
        //data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
        Get.rawSnackbar(
          title: "SADLY",
          message: "The item has not been deleted from Cart",
          backgroundColor: const Color.fromARGB(255, 149, 11, 11),
          borderRadius: 15,
          margin: const EdgeInsets.all(15),
        );
      }
    }
    update();
  }

  resetVarCart() {
    totalitemscount = 0;
    priceorders = 0.0;
    data.clear();
  }

  refreshCartPage() {
    resetVarCart();
    view();
    data.clear();
  }

  view() async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await cartData.viewCart(myServices.sharedPreferences.getInt("id")!);
    //print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        if (response['datacart']['status'] == "success") {
          List dataresponse = response['datacart']['data'];
          Map dataresponsecountprice = response['countprice'];
          data.clear();
          data.addAll(dataresponse.map((e) => CartModel.fromJson(e)));
          totalitemscount = int.parse(dataresponsecountprice['totalcount']);
          priceorders = dataresponsecountprice['totalprice'];
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  goToCheckoutPage() {
    if (data.isEmpty) return Get.snackbar("تنبيه", "السله فارغه");
    Get.toNamed(AppRoute.checkout, arguments: {
      "couponid": couponId ?? 0,
      "priceorder": priceorders,
      "discountcoupon": discountCoupon
    });
  }

  getTotalPrice() {
    return priceorders - (priceorders * discountCoupon! / 100);
  }

  cheekCoupon() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.checkCoupon(couponController.text);
    //print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        Map<String, dynamic> datacoupon = response['data'];
        couponModel = CouponModel.fromJson(datacoupon);
        discountCoupon = couponModel!.couponDiscount!;
        couponCode = couponModel!.couponCode;
        couponId = couponModel!.couponId;
        couponController.clear();
        Get.rawSnackbar(
          //title: "GREAT",
          titleText: const Text(
            'GREAT',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          messageText: const Text(
            'The coupon has been applyed.',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          //message: "The coupon has been applyed.",
          backgroundColor: AppColor.silverGreen,
          borderRadius: 15,
          margin: const EdgeInsets.all(15),
        );
        //data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.none;
        discountCoupon = 0;
        couponCode = null;
        couponId = null;
        Get.rawSnackbar(
          titleText: const Text(
            'SADLY',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          messageText: const Text(
            'The coupon not working.',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: AppColor.red,
          snackStyle: SnackStyle.FLOATING,
          borderRadius: 15,
          margin: const EdgeInsets.all(15),
        );
      }
      update();
    }
  }

  @override
  void onInit() {
    couponController = TextEditingController();
    view();
    super.onInit();
  }
}
