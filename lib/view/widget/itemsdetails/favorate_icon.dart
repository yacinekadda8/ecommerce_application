import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class FavorateIcon extends StatelessWidget {
  final void Function()? onPressed;
  const FavorateIcon({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 210, // Adjust the top position of the button
        right: 40, // Adjust the left position of the button
        child: IconButton(
          icon: const Icon(
            Icons.favorite_border_outlined,
            color: AppColor.silverGreen,
            size: 60,
          ),
          onPressed: onPressed,
        ));
  }
}
