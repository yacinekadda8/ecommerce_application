import 'package:ecommerce_application/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String hintText;
  final void Function()? onPressedIcon;
  final void Function()? onPressedSearch;
  final IconData icon; // Icons.notifications_outlined

  const CustomAppBar(
      {super.key,
      required this.hintText,
      this.onPressedIcon,
      required this.icon,
      this.onPressedSearch});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 12.0),
        child: Row(
          children: [
            Expanded(
                child: TextFormField(
                  
              decoration: InputDecoration(
                
                hintText: hintText,
                hintStyle: const TextStyle(fontSize: 20, color: AppColor.white),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                suffixIcon: IconButton(
                  onPressed: onPressedSearch,
                  icon: const Icon(Icons.search_outlined,
                      size: 25, color: AppColor.white),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
                focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    borderSide: BorderSide(
                      color: AppColor.primaryblueColor,
                    )),
              ),
            )),
            Container(
              padding: const EdgeInsets.only(left: 12.0),
              width: 60,
              child: IconButton(
                  onPressed: onPressedIcon,
                  icon: Icon(icon, size: 30, color: AppColor.white)),
            )
          ],
        ),
      ),
    );
  }
}
