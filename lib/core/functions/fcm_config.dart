import 'package:ecommerce_application/controller/orders/pending_controller.dart';
import 'package:ecommerce_application/core/constant/color.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:get/get.dart';

requestNotificationPermission() async {
    await FirebaseMessaging.instance.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
}

fcmConfig() {
  FirebaseMessaging.onMessage.listen((message) {
    //print("============ messageNotification ================");
    //print(message.notification!.title);
    //print(message.notification!.body);
    FlutterRingtonePlayer.playNotification();
    String? title = message.notification!.title!;
    String? body = message.notification!.body!;
    Get.snackbar(
      title,
      body,
      backgroundColor: AppColor.red,
      colorText: AppColor.backgroundcolor,
      duration: const Duration(seconds: 10),
    );
    refreshOrdersScreen(message.data);
  });
}

refreshOrdersScreen(data) {
  //print(" ============ message.data ================");
  //print(data['pageid']);
  //print(data['pagename']);
  //print(" ============ currentRoute ================");
  //print(Get.currentRoute);

  if (Get.currentRoute == "/orderspending" && data['pagename'] == "orders") {
    //print(" ============ reffresh ================");
    OrdersPendingController controller = Get.find();
    controller.refrehOrder();
  }
}
