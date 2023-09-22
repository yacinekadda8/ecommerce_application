import 'package:ecommerce_application/view/screen/home.dart';
import 'package:ecommerce_application/view/screen/offers.dart';
import 'package:ecommerce_application/view/screen/settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int page);
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentpage = 0;
  List<Widget> listPage = [
    const HomePage(),
    const Offers(),
    const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text('Notification'),
        )
      ],
    ),

    const MySettings(),
  ];

  List iconBottomAppBar = [
    Icons.local_mall,
    Icons.monetization_on,
    Icons.notifications,
    Icons.settings,
  ];
  @override
  changePage(int page) {
    currentpage = page;
    update();
  }
}
