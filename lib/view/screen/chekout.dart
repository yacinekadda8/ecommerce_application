import 'package:ecommerce_application/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Chekout'),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: ListView(
            children: [
              const AskWidget(qstion: 'Choose Payment Method'),
              Container(
                height: 60,
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                    color: AppColor.primaryblueColor,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      width: 4,
                      color: AppColor.silverGreen,
                    )),
                child: const Center(
                  child: Text(
                    'Credit Card',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      height: 1.2,
                      fontWeight: FontWeight.bold,
                      color: AppColor.silverGreen,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                height: 60,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                    color: AppColor.primaryblueColor,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      width: 2,
                      color: AppColor.backgroundcolor,
                    )),
                child: const Center(
                  child: Text(
                    'Cash On Delivery',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      height: 1.2,
                      fontWeight: FontWeight.bold,
                      color: AppColor.backgroundcolor,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const AskWidget(qstion: 'Choose Delivery Type'),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: Get.height / 5.2,
                    width: Get.width / 3,
                    decoration: BoxDecoration(
                        color: AppColor.primaryblueColor,
                        border: Border.all(
                          color: AppColor.silverGreen,
                          width: 4,
                        ),
                        borderRadius: BorderRadius.circular(15)),
                    child: const Column(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Icon(
                            Icons.delivery_dining,
                            color: AppColor.silverGreen,
                            size: 70,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            'Delivery',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 26,
                              color: AppColor.silverGreen,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: Get.height / 5.2,
                    width: Get.width / 3,
                    decoration: BoxDecoration(
                        color: AppColor.primaryblueColor,
                        borderRadius: BorderRadius.circular(15)),
                    child: const Column(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Icon(
                            Icons.store,
                            color: AppColor.backgroundcolor,
                            size: 70,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            'Store',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 26,
                              color: AppColor.backgroundcolor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const AskWidget(qstion: 'Choose The Address'),
              const SizedBox(height: 10),
              const AddressCard(color: AppColor.primaryblueColor),
              const AddressCard(color: AppColor.grey),
            ],
          ),
        ),
      ),
    );
  }
}

class AddressCard extends StatelessWidget {
  final Color color;
  const AddressCard({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppColor.backgroundcolor,
            border: Border.all(
              color: color, // Border color
              width: 2.0, // Border width
            ),
            borderRadius: BorderRadius.circular(14.0), // Border radius
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('My Home',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColor.primaryblueColor)),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                  child: const Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'City: ',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: AppColor.primaryblueColor),
                          ),
                          Text('Algeria Saida',
                              style: TextStyle(
                                  fontSize: 18, color: AppColor.silverGreen)),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Street: ',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: AppColor.primaryblueColor),
                          ),
                          Text('Lassas block 8 nmr 7',
                              style: TextStyle(
                                  fontSize: 18, color: AppColor.silverGreen)),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Phone: ',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: AppColor.primaryblueColor),
                          ),
                          Text('0799704851',
                              style: TextStyle(
                                  fontSize: 18, color: AppColor.silverGreen)),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class AskWidget extends StatelessWidget {
  final String qstion;
  const AskWidget({super.key, required this.qstion});

  @override
  Widget build(BuildContext context) {
    return Text(
      qstion,
      style: const TextStyle(fontSize: 26, color: AppColor.silverGreen),
    );
  }
}
