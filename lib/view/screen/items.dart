// ignore_for_file: avoid_print

import 'package:ecommerce_application/controller/favorite_controller.dart';
import 'package:ecommerce_application/core/class/handlingdataview.dart';
import 'package:ecommerce_application/core/constant/color.dart';
import 'package:ecommerce_application/view/screen/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/homepage_controller.dart';
import '../../controller/items_controller.dart';
import '../../data/model/itemsmodel.dart';
import '../widget/customappbar.dart';
import '../widget/items/customlistitems.dart';
import '../widget/items/listcategoriesitems.dart';

class Items extends StatelessWidget {
  const Items({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var myHeight = Get.height;
    Get.put(ItemsControllerImp());
    FavoriteController controllerFav = Get.put(FavoriteController());

    return GetBuilder<HomeControllerImp>(
        builder: (homecontroller) =>
     Scaffold(
      backgroundColor: AppColor.backgroundcolor,
      body: Container(
          height: myHeight,
          padding: const EdgeInsets.all(8),
          child: ListView(children: [
    
            CustomAppBar(
              isSearching: homecontroller.isSearch,
                    textSearchController: homecontroller.textSearchController!,
                    onChanged: (value) {
                      //value = controller.textSearchController.text;
                      homecontroller.checkSearch(value);
                    },
                    hintText: "search",
                    icon: Icons.notifications_outlined,
                    //onPressedNotifIcon: () {},
                    onPressedFavoriteIcon: () {
                      homecontroller.goToMyfavorites(
                        ItemsModel(),
                      );
                    },
                    onPressedSearch: () 
                    =>  homecontroller.onSearchItems()
                    ,
                    onPressedX: () => homecontroller.clearSearch()
                  ),
                  HandlingDataView(
                      statusRequest: homecontroller.statusRequest,
                      widget: homecontroller.isSearch == false
                          ?
                  Column(
                    children: [
                                  const ListCategoriesItems(),
            const SizedBox(height: 5),
            GetBuilder<ItemsControllerImp>(
                builder: (controller) => HandlingDataView(
                    statusRequest: controller.statusRequest,
                    widget: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 4,
                          mainAxisSpacing: 4,
                          childAspectRatio: (Get.width) / (myHeight / 1.2),
                        ),
                        itemCount: controller.data.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          controllerFav.isFavorite[controller.data[index]
                                  ['items_id']] =
                              controller.data[index]['favorite'];
                          return CustomListItem(
                              //isFav: false,
                              itemsModel:
                                  ItemsModel.fromJson(controller.data[index]));
                        })))
                    ],
                  ) : SearchList(
                              listSearchDataModel:
                                  homecontroller.listSearchDataModel,
                              
                            )
     )])),
    ));
  }
}
