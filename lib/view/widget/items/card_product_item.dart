import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/controller/favorate_controller.dart';
import 'package:e_commerce/controller/items_controller.dart';
import 'package:e_commerce/core/class/funcrtions/translate_database.dart';
import 'package:e_commerce/core/constants/app_colors.dart';
import 'package:e_commerce/data/model/items_model.dart';
import 'package:e_commerce/link_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardProductItem extends GetView<ItemsControllerImp> {
  const CardProductItem({super.key, required this.items});
  final List<ItemsModel> items;
  @override
  Widget build(BuildContext context) {
    ItemsControllerImp controller = Get.put(ItemsControllerImp());
    FavoriteControllerImp favController = Get.put(FavoriteControllerImp());
    return GridView.builder(
      itemCount: controller.items.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 0.61, crossAxisCount: 2),
      itemBuilder: (context, index) {
        favController.isFavorite[controller.items[index].itemsId] =
            controller.items[index].isfav;
        return CardItem(
          item: items[index],
          isfav: controller.items[index].isfav,
        );
      },
    );
  }
}

class CardItem extends GetView<ItemsControllerImp> {
  const CardItem({required this.isfav, super.key, required this.item});
  final ItemsModel item;
  final isfav;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.gotoProductsDetails(item);
      },
      child: Card(
          child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                  tag: item.itemsId!.toString(),
                  child: CachedNetworkImage(
                    width: 120,
                    height: 120,
                    fit: BoxFit.fitWidth,
                    imageUrl: '${AppLink.imageItems}/${item.itemsImage}',
                  ),
                ),
                Text(
                  '${translateDataBase(item.itemsNameAr, item.itemsName)}',
                  style: const TextStyle(fontSize: 15),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  '${translateDataBase(item.itemsDescAr, item.itemsDesc)}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: AppColors.grey),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        if (item.itemsDiscount! > 0)
                          Text(
                            '${item.itemsPrice} \$',
                            style: const TextStyle(
                                fontSize: 16,
                                decoration: TextDecoration.lineThrough,
                                fontWeight: FontWeight.bold,
                                color: Colors.red),
                          ),
                        Text(
                          '${item.itemsPriceDiscount} \$',
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: AppColors.black),
                        ),
                      ],
                    ),
                    const Spacer(),
                    GetBuilder<FavoriteControllerImp>(
                      builder: (controller) => IconButton(
                        onPressed: () {
                          if (controller.isFavorite[item.itemsId] == 1) {
                            controller.setFavorite(item.itemsId!, 0);
                            controller.removeFavorite(item.itemsId!);
                          } else {
                            controller.setFavorite(item.itemsId!, 1);
                            controller.addFavorite(item.itemsId!);
                          }
                        },
                        icon: controller.isFavorite[item.itemsId] == 1
                            ? const Icon(
                                Icons.favorite,
                                color: AppColors.primaryColor,
                              )
                            : const Icon(Icons.favorite_border),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          if (item.itemsDiscount! > 0)
            Positioned(
                left: 10,
                top: 5,
                child: Container(
                    color: Colors.red,
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      child: Text(
                        'Discount',
                        style: TextStyle(
                            color: AppColors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    )))
        ],
      )),
    );
  }
}
