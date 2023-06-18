import 'package:ecommerce_application/core/constant/color.dart';
import 'package:flutter/material.dart';

import '../widget/custom_botification_btn.dart';

class MySettings extends StatelessWidget {
  const MySettings({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.backgroundcolor,
        appBar: AppBar(
          actionsIconTheme: const IconThemeData(color: AppColor.silverGreen),
          elevation: 0,
          iconTheme: const IconThemeData(color: AppColor.silverGreen),
          backgroundColor: AppColor.backgroundcolor,
          actions: const [CustomNotificationBtn()],
        ),
        body: const Center(
          child: Text('My settings',
              style: TextStyle(
                fontSize: 40,
              )),
        ));
  }
}
