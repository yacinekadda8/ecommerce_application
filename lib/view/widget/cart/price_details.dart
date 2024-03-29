// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PriceDetailsCard extends StatelessWidget {
  final String title;
  final double price;
  final Color? color;
  const PriceDetailsCard({
    Key? key,
    required this.title,
    required this.price,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontFamily: "arial",
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            NumberFormat.currency(locale: 'ar_DZ', decimalDigits: 2)
                .format(price),
            style: TextStyle(
              color: color ?? Colors.black,
              fontSize: 18,
              fontFamily: "sans",
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
