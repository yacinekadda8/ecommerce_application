import 'package:ecommerce_application/controller/setting_controller.dart';
import 'package:ecommerce_application/core/constant/color.dart';
import 'package:ecommerce_application/core/constant/imgaeasset.dart';
import 'package:ecommerce_application/core/constant/approutes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MySettings extends StatelessWidget {
  const MySettings({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SettingsController controller = Get.put(SettingsController());
    return Scaffold(
      backgroundColor: AppColor.backgroundcolor,
      body: SizedBox(
          child: ListView(
        children: [
          Stack(
            //alignment: Alignment.centerLeft,
            children: [
              Container(color: AppColor.silverGreen, height: Get.width / 1.6),
              Positioned(
                  child: Padding(
                padding:
                    const EdgeInsets.only(left: 26.0, right: 26.0, top: 30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      'Settings',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: 40,
                          color: AppColor.backgroundcolor,
                          fontFamily: "arial",
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          //color: Colors.red,
                          child: Container(
                            padding: const EdgeInsets.all(3),
                            decoration: BoxDecoration(
                                color: AppColor.white,
                                borderRadius: BorderRadius.circular(50)),
                            child: const CircleAvatar(
                              radius: 40,
                              backgroundColor: AppColor.white,
                              backgroundImage:
                                  AssetImage(AppImageAsset.settingsPic),
                              //foregroundImage: AssetImage(AppImageAsset.settingsPic),
                            ),
                          ),
                        ),
                        Container(
                          width: Get.width / 1.7,
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          //color: Colors.yellow,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                controller.username ?? 'Unkown',
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: const TextStyle(
                                    fontSize: 28,
                                    color: AppColor.white,
                                    fontFamily: "sans",
                                    height: 1.4,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                controller.userId ?? 'Unkown',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                textAlign: TextAlign.start,
                                style: const TextStyle(
                                    fontSize: 18,
                                    color: AppColor.backgroundcolor,
                                    fontFamily: "sans",
                                    height: 1.4,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ))
            ],
          ),
          Container(
            color: AppColor.primaryblueColor,
            height: 130,
            padding: const EdgeInsets.only(left: 26.0, right: 26.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  "My orders",
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.toNamed(AppRoute.orderspending);
                      },
                      child: const Column(
                        children: [
                          Icon(
                            Icons.local_shipping,
                            color: Colors.black,
                            size: 40,
                          ),
                          Text(
                            "Pending",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Get.toNamed(AppRoute.ordersarchive);
                      },
                      child: const Column(
                        children: [
                          Icon(
                            Icons.fact_check,
                            color: Colors.black,
                            size: 40,
                          ),
                          Text(
                            "Shipped",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Card(
              color: AppColor.backgroundcolor,
              child: Column(children: [
                ListTile(
                  onTap: () {},
                  title: const Text("Notification",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  leading: const Icon(Icons.notification_important,
                      color: Colors.green),
                  trailing: Switch(
                    value: controller.isSwitchOn,
                    onChanged: (val) {},
                  ),
                  tileColor: AppColor.backgroundcolor,
                  iconColor: AppColor.white,
                  textColor: AppColor.white,
                ),
                ListTile(
                  onTap: () {
                    Get.toNamed(AppRoute.addressView);
                  },
                  tileColor: AppColor.backgroundcolor,
                  iconColor: AppColor.white,
                  textColor: AppColor.white,
                  title: const Text("Address",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  leading: const Icon(Icons.location_on, color: Colors.red),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                ),

                /* Divider(
                    height: 14, color: AppColor.backgroundcolor, thickness: 2), */

                const ListTile(
                  title: Text("App info",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  leading: Icon(Icons.info, color: Colors.yellow),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  tileColor: AppColor.backgroundcolor,
                  iconColor: AppColor.white,
                  textColor: AppColor.white,
                ),
                ListTile(
                  title: const Text("Contact us",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  leading: const Icon(Icons.mail, color: Colors.orange),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  tileColor: AppColor.backgroundcolor,
                  iconColor: AppColor.white,
                  textColor: AppColor.white,
                  onTap: () {
                    controller.contactUs();
                  },
                ),
                ListTile(
                  title: const Text("Logout",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  leading:
                      const Icon(Icons.exit_to_app_rounded, color: Colors.pink),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  tileColor: AppColor.backgroundcolor,
                  iconColor: AppColor.white,
                  textColor: AppColor.white,
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              backgroundColor: AppColor.silverGreen,
                              title: const Text('Logout Confirmation'),
                              titleTextStyle: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                                color: AppColor.backgroundcolor,
                              ),
                              content: const Text(
                                  'Are you sure you want to logout?'),
                              actions: <Widget>[
                                TextButton(
                                  child: const Text('Cancel',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      )),
                                  onPressed: () {
                                    Navigator.pop(context); // Close the dialog
                                  },
                                ),
                                TextButton(
                                  child: const Text('Logout',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: AppColor.red,
                                        fontSize: 20,
                                      )),
                                  onPressed: () {
                                    // Perform logout logic here
                                    controller.logout();
                                    // Navigator.pop(context); // Close the dialog
                                  },
                                ),
                              ],
                            ));
                  },
                ),
              ]),
            ),
          )
        ],
      )),
    );
  }
}
