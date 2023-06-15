import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';
import 'custom_boxcolor.dart';
import 'custom_title.dart';

class ItemColors extends StatelessWidget {
  const ItemColors({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTitle(
          title: "Choise a color:",
        ),
        Row(
          children: [
            CustomBoxColor(
                color: Colors.black, bordercolor: AppColor.silverGreen),
            SizedBox(width: 5),
            CustomBoxColor(color: Colors.pink, bordercolor: Colors.pink),
            SizedBox(width: 5),
            CustomBoxColor(color: Colors.blue, bordercolor: Colors.blue),
            SizedBox(width: 5),
            CustomBoxColor(color: Colors.orange, bordercolor: Colors.orange),
          ],
        ),
      ],
    );
  }
}
