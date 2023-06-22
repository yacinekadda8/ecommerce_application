import 'package:ecommerce_application/core/constant/color.dart';
import 'package:ecommerce_application/core/constant/imgaeasset.dart';
import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key});

  @override
  Widget build(BuildContext context) {
    return   Card(
                  //color: AppColor.backgroundcolor,
                  child: Row(
                    children: [
                      Expanded(
                          flex: 2,
                          child: Image.asset(
                            AppImageAsset.settingsPic,
                            height: 90,
                            //fit: BoxFit.cover,
                          )),
                      Expanded(
                          flex: 3,
                          child: ListTile(
                            title: Text(
                              "Macbook M2 Max".toUpperCase(),
                              style: const TextStyle(
                                  fontFamily: "sans",
                                  fontSize: 16,
                                  //color: AppColor.primaryblueColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            subtitle: const Text(
                              "2.5000",
                              style: TextStyle(
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
                                onPressed: () {},
                                icon: const Icon(Icons.add, size: 18)),
                          ),
                          const SizedBox(
                              height: 40,
                              child: Text(
                                '1',
                                style: TextStyle(
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
                                onPressed: () {},
                                icon: const Icon(Icons.remove, size: 18)),
                          ),
                        ],
                      )),
                    ],
                  ),
                );
  }
}