// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:ecommerce_application/core/constant/color.dart';

class CustomAppBar extends StatelessWidget {
  final String hintText;
  //final void Function()? onPressedNotifIcon;
  final void Function()? onPressedFavoriteIcon;
  final void Function()? onPressedSearch;
  final void Function()? onPressedX;
  final IconData icon; //
  final void Function(String)? onChanged;
  final TextEditingController textSearchController;
  final bool isSearching ;

  const CustomAppBar({
    Key? key,
    //required this.onPressedNotifIcon,
    required this.hintText,
    required this.onPressedFavoriteIcon,
    required this.onPressedSearch,
    this.onPressedX,
    required this.icon,
    required this.onChanged,
    required this.textSearchController,
    required this.isSearching,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 12.0),
        child: Row(
          children: [
            Expanded(
                child: TextFormField(
              onFieldSubmitted: onChanged,
              textInputAction: TextInputAction.search,
              controller: textSearchController,
              onChanged: onChanged,
              style: const TextStyle(
                color: AppColor.white,
              ),
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
                prefixIcon: isSearching ? IconButton(
                  onPressed: onPressedX,
                  icon: const Icon(Icons.clear, size: 20, color: AppColor.grey),
                ) : null,
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
            /* Container(
              padding: const EdgeInsets.only(left: 12.0),
              width: 60,
              child: IconButton(
                  onPressed: onPressedNotifIcon,
                  icon: Icon(icon, size: 30, color: AppColor.white)),
            ), */
            Container(
              padding: const EdgeInsets.only(left: 12.0),
              width: 60,
              child: IconButton(
                  onPressed: onPressedFavoriteIcon,
                  icon: const Icon(Icons.favorite_outline,
                      size: 30, color: AppColor.white)),
            ),
          ],
        ),
      ),
    );
  }
}
