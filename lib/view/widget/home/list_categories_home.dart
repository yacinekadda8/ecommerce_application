import 'package:ecommerce_application/controller/homepage_controller.dart';
import 'package:ecommerce_application/core/constant/color.dart';
import 'package:ecommerce_application/core/functions/translate_database.dart';
import 'package:ecommerce_application/data/model/categoriesmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListCategoriesHome extends GetView<HomeControllerImp> {
  const ListCategoriesHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: SizedBox(
        height: 55,
        child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(width: 20),
          scrollDirection: Axis.horizontal,
          itemCount: controller.categories.length,
          itemBuilder: (BuildContext context, int index) {
            return Categories(
                i: index,
                categoriesModel:
                    CategoriesModel.fromJson(controller.categories[index]));
          },
        ),
      ),
    );
  }
}

class Categories extends GetView<HomeControllerImp> {
  final CategoriesModel categoriesModel;
  final int? i;
  const Categories({Key? key, required this.i, required this.categoriesModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      hoverColor: AppColor.silverGreen,
      color: AppColor.primaryblueColor,
      onPressed: () {
        controller.goToItems(
            controller.categories, i!, categoriesModel.categoriesId.toString());
      },
      child: SizedBox(
        child: Text(
          "${translateDatabase(categoriesModel.categoriesNameAr, categoriesModel.categoriesName)}",
          style: const TextStyle(
            fontSize: 26,
            color: AppColor.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
