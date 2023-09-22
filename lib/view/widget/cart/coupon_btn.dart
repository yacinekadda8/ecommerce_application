import 'package:flutter/material.dart';

class CouponBtn extends StatelessWidget {
  final String textbutton;
  final double? fontSize;
  final Color? containerColor;
  final Color? textColor;
  final Color? buttonColor;
  final void Function()? onPressed;
  const CouponBtn(
      {Key? key,
      required this.textbutton,
      required this.fontSize,
      this.onPressed,
      this.containerColor,
      this.textColor,
      this.buttonColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 30,
      //color: containerColor,
      //padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      width: double.infinity,
      child: MaterialButton(
        color: buttonColor,
        height: 42,
        textColor: textColor,
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Text(textbutton,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: fontSize,
              fontFamily: "arial",
            )),
      ),
    );
  }
}
