import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/controller/products_details_controller/products_details_controller.dart';
import 'package:e_commerce/core/constants/app_colors.dart';
import 'package:e_commerce/link_api.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class TopProductDetailsItem extends GetView<ProductDetailsControllerImp> {
  const TopProductDetailsItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 200,
          decoration: const BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))),
        ),
        Positioned(
            right: Get.width / 8,
            top: 50,
            child: Hero(
              tag: controller.itemsModel.itemsId!.toString(),
              child: CachedNetworkImage(
                  width: 300,
                  imageUrl:
                        '${AppLink.imageItems}/${controller.itemsModel.itemsImage!}'),
            ))
      ],
    );

  }
}
