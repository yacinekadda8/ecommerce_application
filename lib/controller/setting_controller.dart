import 'package:ecommerce_application/core/constant/approutes.dart';
import 'package:ecommerce_application/core/services/services.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsController extends GetxController {
  MyServices myServices = Get.find();
  bool isSwitchOn = false;
  String? userId;
  String? email;
  String? username;
  String? phone;

  getUserData() {
    userId = myServices.sharedPreferences.getString('id')!;
    email = myServices.sharedPreferences.getString('email')!;
    username = myServices.sharedPreferences.getString('username')!;
    phone = myServices.sharedPreferences.getString('phone')!;
  }

  logout() {
    myServices.sharedPreferences.clear();
    Get.offAllNamed(AppRoute.login);
  }

  //myServices.sharedPreferences.getInt("id");

  contactUs() async {
    await launchUrl(Uri.parse("tel:+213790704851"));
  }
}
