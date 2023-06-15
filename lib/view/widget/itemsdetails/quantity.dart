import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';
import 'custom_title.dart';

class Quantity extends StatelessWidget {
  const Quantity({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CustomTitle(
                        title: "Quantity:",
                      ),
                      const SizedBox(width: 80),
                      const Icon(Icons.add, size: 40, color: AppColor.white),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 15),
                        width: 40,
                        color: AppColor.silverGreen,
                        alignment: Alignment.center,
                        child: const Text(
                          '1',
                          style: TextStyle(
                            color: AppColor.backgroundcolor,
                            fontSize: 50,
                            height: .9,
                          ),
                        ),
                      ),
                      const Icon(Icons.remove, size: 40, color: AppColor.white),
                    ],
                  );
  }
}