import 'package:ecommerce_application/controller/homepage_controller.dart';
import 'package:ecommerce_application/core/constant/color.dart';
import 'package:ecommerce_application/data/model/categoriesmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListCategoriesHome extends GetView<HomepageControllerImp> {
  const ListCategoriesHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12.0),
      height: 80,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(width: 20),
        scrollDirection: Axis.horizontal,
        itemCount: controller.categories.length,
        itemBuilder: (BuildContext context, int index) {
          return Categories(
              categoriesModel:
                  CategoriesModel.fromJson(controller.categories[index]));
        },
      ),
    );
  }
}

class Categories extends StatelessWidget {
  final CategoriesModel categoriesModel;
  const Categories({super.key, required this.categoriesModel});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: AppColor.primaryColor,
          borderRadius: BorderRadius.circular(18),
          /*border: Border.all(
            color: AppColor.primaryColor, // Specify the border color here
            width: 6.0, // Specify the border width here
          ),*/
        ),
        //color: Colors.red,
        child: /* SvgPicture.network("${AppLink.imageCategories}/${controller.categories[index]['categories_image']}")*/
            Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Text(
            "${categoriesModel.categoriesName}",
            style: const TextStyle(
              fontSize: 30,
              color: AppColor.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ));
  }
}
