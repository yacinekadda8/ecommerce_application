import 'package:flutter/material.dart';

class CustomNotificationBtn extends StatelessWidget {
  const CustomNotificationBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 12.0),
      width: 60,
      child: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.notifications_outlined,
            size: 30,
          )),
    );
  
  }
}
