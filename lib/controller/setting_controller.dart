import 'package:ecommerce_application/core/constant/routes.dart';
import 'package:ecommerce_application/core/services/services.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsController extends GetxController {
  MyServices myServices = Get.find();
  bool isSwitchOn = false;


  logout() {
    myServices.sharedPreferences.clear();
    Get.offAllNamed(AppRoute.login);
  }

  contactUs() async {
    await launchUrl(Uri.parse("tel:+213790704851"));
  }
}
