// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';
import 'custom_title.dart';

class Quantity extends StatelessWidget {
  final String quantity;
  final void Function()? onAddTap;
  final void Function()? onRemoveTap;
  const Quantity({
    Key? key,
    required this.quantity,
    required this.onAddTap,
    required this.onRemoveTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const CustomTitle(
          title: "Quantity:",
        ),
        SizedBox(width: Get.width / 6),
        Row(
          children: [
            IconButton(
                // plus
                onPressed: onAddTap,
                icon: const Icon(Icons.add, size: 34, color: AppColor.white)),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              width: 40,
              //color: AppColor.silverGreen,
              alignment: Alignment.center,
              child: Text(
                quantity,
                style: const TextStyle(
                  color: AppColor.silverGreen,
                  fontSize: 40,
                  height: .9,
                ),
              ),
            ),
            IconButton(
                // minus
                onPressed: onRemoveTap,
                icon:
                    const Icon(Icons.remove, size: 34, color: AppColor.white)),
          ],
        )
      ],
    );
  }
}
