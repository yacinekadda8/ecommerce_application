import 'package:ecommerce_application/controller/homepage_controller.dart';
import 'package:ecommerce_application/core/constant/color.dart';
import 'package:ecommerce_application/data/model/categoriesmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListCategoriesHome extends GetView<HomeControllerImp> {
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
              i : index,
              categoriesModel:
                  CategoriesModel.fromJson(controller.categories[index]));
        },
      ),
    );
  }
}

class Categories extends GetView<HomeControllerImp> {
  final CategoriesModel categoriesModel;
  final int? i;
  const Categories({Key? key, required this.i, required this.categoriesModel}): super(key:key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToItems(controller.categories, i!,categoriesModel.categoriesId.toString());
      },
      child: Container(
          decoration: BoxDecoration(
            color: AppColor.primaryblueColor,
            borderRadius: BorderRadius.circular(18),
          ),
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
          )),
    );
  }
}
