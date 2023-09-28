import 'package:ecommerce_application/core/constant/color.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:get/get.dart';

requestNotificationPermission() async {
  NotificationSettings settings =
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
  FirebaseMessaging.onMessage.listen((remoteMessage) {
    print("====== remoteMessageNotification ==========");
    print(remoteMessage.notification!.title);
    print(remoteMessage.notification!.body);
    FlutterRingtonePlayer.playNotification();
    String? title = remoteMessage.notification!.title!;
    String? body = remoteMessage.notification!.body!;
    Get.snackbar(
      title,
      body,
      backgroundColor: AppColor.red,
      colorText: AppColor.backgroundcolor,
    );
  });
}
