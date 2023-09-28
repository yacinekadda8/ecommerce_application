import 'package:ecommerce_application/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

import '../../controller/notifications_controller.dart';
import '../../data/model/notification_model.dart';

class MyNotification extends StatelessWidget {
  const MyNotification({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NotificationController());
    return Scaffold(
        body: SafeArea(
            child: GetBuilder<NotificationController>(
                builder: (controller) => ListView(
                      children: [
                        SizedBox(height: 40),
                        const Text(
                          'MESSAGES',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 60,
                            color: Colors.white,
                            height: 1.1,
                          ),
                        ),
                        SizedBox(height: 20),
                        ...List.generate(
                            controller.data.length,
                            (index) => NotificationItem(
                                  notificationModel: controller.data[index],
                                ))
                      ],
                    ))));
  }
}

class NotificationItem extends StatelessWidget {
  final NotificationModel notificationModel;
  const NotificationItem({super.key, required this.notificationModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 10),
      child: InkWell(
        onTap: () {
          // controller.goToItemsDetailsScreen(itemsModel);
        },
        child: Card(
            color: AppColor.silverGreen,
            child: ListTile(
              title: Text(notificationModel.notificationTitle!,
                  style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w800
                      //height: 1.1,
                      )),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(notificationModel.notificationBody!,
                      style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                          fontWeight: FontWeight.w500
                          //height: 1.1,
                          )),
                  Text(
                      Jiffy(notificationModel.notificationDate!, "yyyy-MM-dd")
                          .fromNow(),
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                          fontSize: 16,
                          color: AppColor.red,
                          fontWeight: FontWeight.w500
                          //height: 1.1,
                          )),
                ],
              ),
            )),
      ),
    );
  }
}
