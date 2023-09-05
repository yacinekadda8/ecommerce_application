import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';

class ContinueBtn extends StatelessWidget {
  final  void Function()? onPressed;
  final String title;
  const ContinueBtn({
    super.key,
   required this.onPressed,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width / 1.5,
      margin: const EdgeInsets.only(top: 10, bottom: 26),
      child: MaterialButton(
        onPressed: onPressed,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        padding: const EdgeInsets.symmetric(vertical: 13),
        color: AppColor.silverGreen,
        textColor: AppColor.black,
        child:  Text(title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            )),
      ),
    );
  }
}
