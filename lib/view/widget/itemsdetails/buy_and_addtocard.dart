// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class GoToCard extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  const GoToCard({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: /* Row(
        //mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          
          IconButton(
              onPressed: addCart,
              icon: const Icon(
                Icons.add_shopping_cart,
                color: AppColor.primaryblueColor,
                size: 30,
              )),*/
            //const SizedBox(width: 60),
            TextButton(
          /*
                        minWidth: 240,
          padding: const EdgeInsets.all(10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            side: const BorderSide(
              color: AppColor.primaryblueColor,
              width: 3.0,
            ),
          ),
          color: AppColor.primaryblueColor, */
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColor.primaryblueColor,
          ),
          onPressed: onPressed,
          child: Text(text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColor.black,
                fontFamily: "arial",
              )),
        )
        /* ],
      ),*/
        );
  }
}
