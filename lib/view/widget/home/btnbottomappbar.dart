import 'package:flutter/material.dart';
import '../../../core/constant/color.dart';

class ButtonBottomAppBar extends StatelessWidget {
  final void Function()? onPressed;
  final String title;
  final IconData iconData;
  final bool? isActive;

  const ButtonBottomAppBar({
    super.key,
    required this.onPressed,
    required this.title,
    required this.iconData,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    //width: MediaQuery.of(context).size.width / 4.5,
    //color: AppColor.secoundColor,
    return MaterialButton(
      onPressed: onPressed,
      child: Icon(
        iconData,
        color:
            isActive == true ? AppColor.silverGreen : AppColor.backgroundcolor,
        size: 37,
      ),
    );
  }
}
