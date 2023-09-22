import 'package:ecommerce_application/controller/auth/successsignup_controller.dart';
import 'package:ecommerce_application/core/constant/color.dart';
import 'package:ecommerce_application/view/widget/auth/custombuttonauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessSignUp extends StatelessWidget {
  const SuccessSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SuccessSignUpControllerImp controller =
        Get.put(SuccessSignUpControllerImp());
    return Scaffold(
      backgroundColor: AppColor.backgroundcolor,
      body: Container(
        padding:
            const EdgeInsets.only(top: 45, bottom: 45, left: 15, right: 15),
        child: Column(children: [
          SizedBox(height: Get.height / 10),
          const Center(
              child: Icon(
            Icons.check_circle_outline,
            size: 200,
            color: AppColor.primaryblueColor,
          )),
          Text("37".tr,
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(fontSize: 30)),
          Text(
            "38".tr,
            style: TextStyle(fontSize: 30, color: Colors.green[400]),
          ),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: CustomButtomAuth(
                text: "31".tr,
                onPressed: () {
                  controller.goToPageLogin();
                }),
          ),
          const SizedBox(height: 30)
        ]),
      ),
    );
  }
}
