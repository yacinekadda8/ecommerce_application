import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/itemdetails_controller.dart';
import '../../../linkapi.dart';

class ItemImage extends GetView<ItemDetailsControllerImp> {
  const ItemImage({super.key});

  @override
  Widget build(BuildContext context) {
    return /* Hero(tag: "${controller.itemsModel.itemsId}",
                    child: */
        CachedNetworkImage(
      imageUrl: "${AppLink.imageItems}/${controller.itemsModel.itemsImage}",
      height: 280,
      width: 480,
      fit: BoxFit.fitHeight,
    );
  }
}
