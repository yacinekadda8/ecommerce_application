import 'package:ecommerce_application/core/constant/approutes.dart';
import 'package:ecommerce_application/core/services/services.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsController extends GetxController {
  MyServices myServices = Get.find();
  bool isSwitchOn = false;
  //late String userId;

  String getUserData(String val) {
    String userId = myServices.sharedPreferences.getString("id")!;
    String email = myServices.sharedPreferences.getString("email")!;
    String username = myServices.sharedPreferences.getString("username")!;
    String phone = myServices.sharedPreferences.getString("phone")!;
    if (val == "id") {
      return userId;
    } else if (val == "email") {
      return email;
    } else if (val == "username") {
      return username;
    } else if (val == "phone") {
      return phone;
    } else {
      return '';
    }
  }

  logout() {
    String userId = myServices.sharedPreferences.getString("id")!;
    FirebaseMessaging.instance.unsubscribeFromTopic("users");
    FirebaseMessaging.instance.unsubscribeFromTopic("users$userId");
    myServices.sharedPreferences.clear();
    Get.offAllNamed(AppRoute.login);
  }

  //myServices.sharedPreferences.getString("id");

  contactUs() async {
    await launchUrl(Uri.parse("tel:+213790704851"));
  }
}
