import 'package:flutter/material.dart';

class CustomCartButton extends StatelessWidget {
  final String textbutton;
  final Color? containerColor;
  final Color? textColor;
  final Color? buttonColor;
  final void Function()? onPressed;
  const CustomCartButton(
      {Key? key,
      required this.textbutton,
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
        height: 50,
        textColor: textColor,
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.0),
        ),
        child: Text(textbutton,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 26,
              fontFamily: "arial",
            )),
      ),
    );
  }
}
