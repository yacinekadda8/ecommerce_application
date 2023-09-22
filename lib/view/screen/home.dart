import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_application/controller/home_controller.dart';
import 'package:ecommerce_application/core/class/handlingdataview.dart';
import 'package:ecommerce_application/core/constant/color.dart';
import 'package:ecommerce_application/core/functions/translate_database.dart';
import 'package:ecommerce_application/data/model/itemsmodel.dart';
import 'package:ecommerce_application/linkapi.dart';
import 'package:ecommerce_application/view/widget/customappbar.dart';
import 'package:ecommerce_application/view/widget/home/customcardhome.dart';
import 'package:ecommerce_application/view/widget/home/customtitlehome.dart';
import 'package:ecommerce_application/view/widget/home/list_categories_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/home/listitemshome.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeControllerImp controllerImp = Get.put(HomeControllerImp());

    return GetBuilder<HomeControllerImp>(
        builder: (controller) => SizedBox(
                //color: AppColor.backgroundcolor,
                child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 12.0),
              child: ListView(
                children: [
                  CustomAppBar(
                      isSearching: controller.isSearch,
                      textSearchController: controller.textSearchController!,
                      onChanged: (value) {
                        //value = controller.textSearchController.text;
                        controller.checkSearch(value);
                      },
                      hintText: "search",
                      icon: Icons.notifications_outlined,
                      //onPressedNotifIcon: () {},
                      onPressedFavoriteIcon: () {
                        controller.goToMyfavorites(
                          ItemsModel(),
                        );
                      },
                      onPressedSearch: () => controller.onSearchItems(),
                      onPressedX: () => controller.clearSearch()),
                  HandlingDataView(
                      statusRequest: controller.statusRequest,
                      widget: controller.isSearch == false
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                controllerImp.settingsData.isNotEmpty
                                    ? CustomCardHome(
                                        title:
                                            "${translateDatabase(controllerImp.settingsData[0]['settings_title_ar'], controllerImp.settingsData[0]['settings_title'])}", //
                                        subtitle:
                                            "${translateDatabase(controllerImp.settingsData[0]['settings_body_ar'], controllerImp.settingsData[0]['settings_body'])}", // cashback
                                      )
                                    : const CustomCardHome(
                                        title: "Welcome", //
                                        subtitle:
                                            "Happy to see you", // cashback
                                      ),
                                CustomTitleHome(
                                  title: "39".tr, // Explore the categoreis
                                ),
                                const ListCategoriesHome(),
                                CustomTitleHome(
                                  title: "40".tr, // Daily Deals
                                ),
                                const ListItemsHome(),
                                CustomTitleHome(
                                  title: "41".tr, // Popular products
                                ),
                                const ListItemsHome(),
                              ],
                            )
                          : SearchList(
                              listSearchDataModel:
                                  controller.listSearchDataModel,
                            ))
                ],
              ),
            )));
  }
}

class SearchList extends GetView<HomeControllerImp> {
  final List<ItemsModel> listSearchDataModel;
  const SearchList({
    super.key,
    required this.listSearchDataModel,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: listSearchDataModel.length,
      itemBuilder: (BuildContext context, int index) {
        //return Text("${listSearchData[index].itemsName}");
        return InkWell(
          onTap: () {
            controller.goToItemsDetailsScreen(listSearchDataModel[index]);
          },
          child: Container(
            //width: Get.width - 200,
            margin: const EdgeInsets.only(bottom: 6, left: 0, right: 0),

            height: Get.height / 6,
            decoration: BoxDecoration(
                color: AppColor.primaryblueColor.withOpacity(.3),
                borderRadius: const BorderRadius.all(Radius.circular(23)),
                border: Border.all(
                  width: 7.2,
                  color: AppColor.white,
                )),
            /*  decoration: BoxDecoration(color: AppColor.itemsColor, gradient: const LinearGradient(colors: [AppColor.white,AppColor.primaryblueColor,],begin: Alignment.topCenter,end: Alignment.bottomCenter, ), borderRadius: BorderRadius.circular(8),),*/
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  //margin: const EdgeInsets.all(4.0),
                  decoration: const BoxDecoration(
                    color: AppColor.white,
                    //borderRadius: BorderRadius.circular(5),
                  ),
                  width: Get.width / 2.8,
                  height: Get.height,
                  child: /* Hero(
                      tag: "${listSearchDataModel[index].itemsId}",
                      child:*/
                      CachedNetworkImage(
                    imageUrl:
                        "${AppLink.imageItems}/${listSearchDataModel[index].itemsImage}",
                    alignment: Alignment.center,
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(left: 10, right: 4),
                  padding: const EdgeInsets.only(left: 2, right: 2),
                  width: Get.width / 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 50,
                        child: Text(
                          "${listSearchDataModel[index].itemsName}"
                              .trim()
                              .toUpperCase(),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          softWrap: true,
                          style: const TextStyle(
                            fontFamily: "Courier",
                            color: AppColor.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "DZD",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontFamily: "Courier",
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              overflow: TextOverflow.ellipsis,
                              color: AppColor.red,
                              height: 1.25,
                            ),
                          ),
                          const SizedBox(width: 4),
                          SizedBox(
                            width: Get.width / 5.5,
                            child: Text(
                              listSearchDataModel[index].itemsPrice.toString(),
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                fontFamily: "Courier",
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                overflow: TextOverflow.ellipsis,
                                color: AppColor.white,
                                height: 1.25,
                              ),
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            "${listSearchDataModel[index].itemsDiscount} %OFF"
                                .toUpperCase(),
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              fontFamily: "sans",
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              overflow: TextOverflow.ellipsis,
                              color: AppColor.backgroundcolor,
                              backgroundColor:
                                  AppColor.silverGreen.withOpacity(.8),
                              height: 1.5,
                              letterSpacing: 0.01,
                              wordSpacing: 0.1,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

/*

Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: AppColor.white,
          ),
          height: Get.height,

          /*  decoration: BoxDecoration(color: AppColor.itemsColor, gradient: const LinearGradient(colors: [AppColor.white,AppColor.primaryblueColor,],begin: Alignment.topCenter,end: Alignment.bottomCenter, ), borderRadius: BorderRadius.circular(8),),*/
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.circular(4),
                ),
                width: Get.width,
                height: Get.height / 5.5,
                child: Hero(
                    tag: "${listSearchData[index].itemsId}",
                    child: CachedNetworkImage(
                      imageUrl:
                          "${AppLink.imageItems}/${listSearchData[index].itemsImage}",
                      alignment: Alignment.center,
                      fit: BoxFit.contain,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  "${listSearchData[index].itemsName}".toUpperCase(),
                  maxLines: 1,
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontFamily: "sans",
                    fontWeight: FontWeight.bold,
                    fontSize: 19,
                    overflow: TextOverflow.ellipsis,
                    color: AppColor.primaryblueColor,
                  ),
                ),
              ),
              Center(
                child: Text(
                  "${listSearchData[index].itemsPrice.toString()} DZD",
                  style: const TextStyle(
                    fontFamily: "sans",
                    fontSize: 26,
                    color: AppColor.silverGreen,
                    fontWeight: FontWeight.bold,
                    height: 2.2,
                    letterSpacing: 0.01,
                    wordSpacing: 0.1,
                  ),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "${listSearchData[index].itemsDiscount} % OFF"
                        .toUpperCase(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontFamily: "sans",
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis,
                      color: AppColor.backgroundcolor,
                      backgroundColor: AppColor.white,
                      height: .9,
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      


*/
