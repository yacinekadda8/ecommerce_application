import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_application/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../linkapi.dart';

class CartItem extends StatelessWidget {
  final String title;
  final double price;
  final String image;
  final String count;
  final void Function()? onAddPressed;
  final void Function()? onRemovePressed;
  const CartItem(
      {super.key,
      required this.title,
      required this.price,
      required this.image,
      required this.count,
      required this.onAddPressed,
      required this.onRemovePressed});

  @override
  Widget build(BuildContext context) {
    return Card(
      //color: AppColor.backgroundcolor,
      child: Row(
        children: [
          Expanded(
              flex: 2,
              child: CachedNetworkImage(
                imageUrl: "${AppLink.imageItems}/$image",
                height: 100,
                width: 120,
                fit: BoxFit.cover,
              )),
          Expanded(
              flex: 3,
              child: ListTile(
                title: Text(
                  title.toUpperCase(),
                  style: const TextStyle(
                      fontFamily: "sans",
                      fontSize: 16,
                      //color: AppColor.primaryblueColor,
                      fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  NumberFormat.currency(locale: 'ar_DZ', decimalDigits: 2)
                      .format(price),
                  style: const TextStyle(
                      fontFamily: "sans",
                      fontSize: 16,
                      color: AppColor.primaryblueColor,
                      fontWeight: FontWeight.bold),
                ),
              )),
          Expanded(
              child: Column(
            children: [
              Container(
                height: 30,
                //width: 30,
                decoration: BoxDecoration(
                  //color: AppColor.silverGreen,
                  borderRadius: BorderRadius.circular(35),
                ),
                child: IconButton(
                    onPressed: onAddPressed,
                    icon: const Icon(Icons.add, size: 18)),
              ),
              SizedBox(
                  height: 40,
                  child: Text(
                    count,
                    style: const TextStyle(
                        fontFamily: "sans",
                        fontSize: 20,
                        color: AppColor.primaryblueColor,
                        fontWeight: FontWeight.bold),
                  )),
              Container(
                height: 30,
                //width: 30,
                decoration: BoxDecoration(
                  // color: AppColor.grey,
                  borderRadius: BorderRadius.circular(35),
                ),
                child: IconButton(
                    onPressed: onRemovePressed,
                    icon: const Icon(Icons.remove, size: 18)),
              ),
            ],
          )),
        ],
      ),
    );
  }
}
