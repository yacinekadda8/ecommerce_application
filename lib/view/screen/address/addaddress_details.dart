import 'package:ecommerce_application/core/class/handlingdataview.dart';
import 'package:ecommerce_application/core/constant/color.dart';
import 'package:ecommerce_application/view/widget/auth/customtextformauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/address/addaddress_details.controller.dart';
import '../../widget/address/continue_btn.dart';

class AddAddressDetails extends StatelessWidget {
  const AddAddressDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddAddressDetailsController());
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Address Info Details',
        ),
      ),
      body: Container(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: GetBuilder<AddAddressDetailsController>(
              builder: (controller) => HandlingDataView(
                    statusRequest: controller.statusRequest,
                    widget: ListView(
                      children: [
                        const Text(
                          'Type Your Address Details.',
                          style: TextStyle(
                            fontSize: 22,
                            color: AppColor.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),
                        CustomTextFormAuth(
                          labeltext: 'Send to:',
                          hinttext: 'My Home, My office ...',
                          iconData: Icons.title,
                          mycontroller: controller.name,
                          valid: (valid) {
                            return;
                          },
                          isNumber: false,
                        ),
                        CustomTextFormAuth(
                          hinttext: 'State',
                          labeltext: 'Add your State',
                          iconData: Icons.location_city,
                          mycontroller: controller.city,
                          valid: (valid) {
                            return;
                          },
                          isNumber: false,
                        ),
                        CustomTextFormAuth(
                          hinttext: 'Full Address',
                          labeltext: 'Write full address',
                          iconData: Icons.place,
                          mycontroller: controller.street,
                          valid: (valid) {
                            return;
                          },
                          isNumber: false,
                        ),
                        CustomTextFormAuth(
                          hinttext: 'Phone number',
                          labeltext: 'Write current Phone',
                          iconData: Icons.place,
                          mycontroller: controller.phone,
                          valid: (valid) {
                            return;
                          },
                          isNumber: false,
                        ),
                        ContinueBtn(
                          title: 'Save',
                          onPressed: () {
                            controller.addAdress();
                          },
                        )
                      ],
                    ),
                  ))),
    );
  }
}
