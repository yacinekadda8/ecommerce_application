import 'package:ecommerce_application/core/constant/color.dart';
import 'package:flutter/material.dart';

class CartAppBAr extends StatelessWidget {
  const CartAppBAr({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: Container(
            alignment: Alignment.center,
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_back_ios,
                  size: 24,
                  color: AppColor.primaryblueColor,
                )),
          )),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: const Text(
                'MY CART',
                maxLines: 1,
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: 30,
                    height: 1.2,
                    fontWeight: FontWeight.bold,
                    color: AppColor.primaryblueColor),
              ),
            ),
          ),
          const SizedBox(width: 100)
        ],
      ),
    );
  }
}
