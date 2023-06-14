import 'package:ecommerce_application/core/constant/color.dart';
import 'package:flutter/material.dart';

import '../widget/customappbar.dart';

class ItemDetails extends StatelessWidget {
  const ItemDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColor.backgroundcolor,
        child: ListView(
          children: [
            CustomAppBar(
              hintText: "search",
              icon: Icons.notifications_outlined,
              onPressedIcon: () {},
              onPressedSearch: () {},
            ),
          ],
        ),
      ),
    );
  }
}
