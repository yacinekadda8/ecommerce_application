import 'package:ecommerce_application/core/constant/color.dart';
import 'package:ecommerce_application/core/constant/approutes.dart';
import 'package:ecommerce_application/core/localization/changelocal.dart';
import 'package:ecommerce_application/view/widget/language/custombuttomlang.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Language extends GetView<LocaleController> {
  const Language({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundcolor,
      body: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("1".tr,
                  style: const TextStyle(
                    color: AppColor.primaryblueColor,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  )),
              const SizedBox(height: 20),
              SizedBox(
                height: Get.height / 10,
                width: Get.width,
                child: CustomButtonLang(
                    textbutton: "العربية",
                    onPressed: () {
                      controller.changeLang("ar");
                      Get.toNamed(AppRoute.onBoarding);
                    }),
              ),
              SizedBox(
                height: Get.height / 10,
                width: Get.width,
                child: CustomButtonLang(
                    textbutton: "English",
                    onPressed: () {
                      controller.changeLang("en");
                      Get.toNamed(AppRoute.onBoarding);
                    }),
              ),
            ],
          )),
    );
  }
}
