import 'package:ecommerce_application/controller/homescreen_controller.dart';
import 'package:ecommerce_application/core/constant/color.dart';
import 'package:ecommerce_application/view/widget/home/btnbottomappbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyBottomNavigationBar extends GetView<HomeScreenControllerImp> {
  const MyBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 0,
      clipBehavior: Clip.antiAlias,
      shape: const CircularNotchedRectangle(),
      notchMargin: 8,
      child: Container(
        color: AppColor.primaryblueColor,
        height: 64,
        child: Row(
          children: [
            ...List.generate(controller.listPage.length + 1, (index) {
              int i = index > 2 ? index - 1 : index;
              return index == 2
                  ? const Spacer()
                  : ButtonBottomAppBar(
                      isActive: controller.currentpage == i ? true : false,
                      iconData: controller.iconBottomAppBar[i],
                      onPressed: () {
                        controller.changePage(i);
                      },
                      title: 'Home',
                    );
            })
          ],
        ),
      ),
    );
  }
}
