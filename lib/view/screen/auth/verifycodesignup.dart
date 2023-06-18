// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

import 'package:ecommerce_application/controller/auth/verfiycodesignup_controller.dart';
import 'package:ecommerce_application/core/class/handlingdataview.dart';
import 'package:ecommerce_application/core/constant/color.dart';
import 'package:ecommerce_application/view/widget/auth/customtextbodyauth.dart';
import 'package:ecommerce_application/view/widget/auth/customtexttitleauth.dart';

class VerfiyCodeSignUp extends StatelessWidget {
  const VerfiyCodeSignUp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double? height = Get.height;
    double? halfHeight = Get.height / 2;

    Get.put(VerifyCodeSignUpControllerImp());
    return Scaffold(
      backgroundColor: AppColor.backgroundcolor,
      body: GetBuilder<VerifyCodeSignUpControllerImp>(
          builder: (controller) => HandlingDataRequest(
              statusRequest: controller.statusRequest!,
              widget: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                child: ListView(children: [
                  SizedBox(height: halfHeight / 15),
                  const CustomTextTitleAuth(text: "Confirmation"),
                  SizedBox(height: halfHeight / 12),
                  Container(
                    height: height - (halfHeight / 2.3),
                    decoration: BoxDecoration(
                      color: AppColor.primaryblueColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 12),
                        Icon(
                          Icons.message_outlined,
                          size: halfHeight / 2,
                          color: AppColor.silverGreen,
                        ),
                        const SizedBox(height: 10),
                        CustomTextBodyAuth(
                            color: AppColor.backgroundcolor,
                            text:
                                "Enter The 5 digit code sent to \n you at :  ${controller.email}"),
                        SizedBox(height: height / 8),
                        OtpTextField(
                          fieldWidth: 50.0,
                          borderRadius: BorderRadius.circular(20),
                          numberOfFields: 5,
                          borderColor: AppColor.itemsColor,
                          cursorColor: AppColor.silverGreen,
                          enabledBorderColor: AppColor.silverGreen,
                          disabledBorderColor: AppColor.itemsColor,
                          fillColor: AppColor.itemsColor,
                          //set to true to show as box or false to show as dash
                          showFieldAsBox: true,
                          //runs when a code is typed in
                          onCodeChanged: (String code) {
                            //handle validation or checks here
                          },
                          //runs when every textfield is filled
                          onSubmit: (String verificationCode) {
                            controller.goToSuccessSignUp(verificationCode);
                          }, // end onSubmit
                        ),
                        const SizedBox(height: 10),
                        Center(
                          child: InkWell(
                            onTap: () {
                              controller.resend();
                            },
                            child: const Text('Resend the code!',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.backgroundcolor,
                                )),
                          ),
                        )
                      ],
                    ),
                  )
                ]),
              ))),
    );
  }
}
