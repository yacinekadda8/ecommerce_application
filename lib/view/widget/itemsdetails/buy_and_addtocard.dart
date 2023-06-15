import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class BuyAndAddToCard extends StatelessWidget {
  const BuyAndAddToCard({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: Row(
                      //mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.add_shopping_cart,
                              color: AppColor.primaryblueColor,
                              size: 30,
                            )),
                        const SizedBox(width: 60),
                        MaterialButton(
                          minWidth: 240,
                          padding: const EdgeInsets.all(10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            side: const BorderSide(
                              color: AppColor.primaryblueColor,
                              width: 3.0,
                            ),
                          ),
                          color: AppColor.primaryblueColor,
                          onPressed: () {},
                          child: const Row(
                            children: [
                              Text('Buy it Now',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: AppColor.black,
                                    fontFamily: "arial",
                                  )),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
  }
}