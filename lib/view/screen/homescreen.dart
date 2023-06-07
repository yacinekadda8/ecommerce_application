import 'package:ecommerce_application/core/constant/color.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        /* floatingActionButton: FloatingActionButton(
            onPressed: () {}, child: const Icon(Icons.shopping_bag_outlined)),
         */ //floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          // shape: const CircularNotchedRectangle(),
          // notchMargin: 10,
          child: Container(
            color: AppColor.grey,
            height: 70,
            child: Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 5,
                  color: Colors.amber[700],
                  child: MaterialButton(
                    onPressed: () {},
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Icon(Icons.home,
                            size: MediaQuery.of(context).size.width / 10),
                        Text(
                          'HOME',
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width / 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 5,
                  color: Colors.amber[700],
                  child: MaterialButton(
                    onPressed: () {},
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Icon(Icons.home,
                            size: MediaQuery.of(context).size.width / 10),
                        Text(
                          'HOME',
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width / 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 5,
                  color: Colors.amber[700],
                  child: MaterialButton(
                    onPressed: () {},
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Icon(Icons.home,
                            size: MediaQuery.of(context).size.width / 10),
                        Text(
                          'HOME',
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width / 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 5,
                  color: Colors.amber[700],
                  child: MaterialButton(
                    onPressed: () {},
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Icon(Icons.home,
                            size: MediaQuery.of(context).size.width / 10),
                        Text(
                          'HOME',
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width / 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 5,
                  color: Colors.amber[700],
                  child: MaterialButton(
                    onPressed: () {},
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Icon(Icons.home,
                            size: MediaQuery.of(context).size.width / 10),
                        Text(
                          'HOME',
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width / 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                  child: Text(
                'Home Screen',
                style: TextStyle(fontSize: 40),
              )),
            ]));
  }
}
