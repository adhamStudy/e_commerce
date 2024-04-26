import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/controller/favorate_controller.dart';
import 'package:e_commerce/controller/items_controller.dart';
import 'package:e_commerce/controller/my_favorite_controller.dart';
import 'package:e_commerce/core/class/funcrtions/translate_database.dart';
import 'package:e_commerce/core/constants/app_colors.dart';
import 'package:e_commerce/data/model/my_favorite_model.dart';
import 'package:e_commerce/link_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardFavoriteList extends GetView<MyFavoriteControllerImp> {
  const CardFavoriteList({super.key, required this.items});
  final List<MyFavoriteModel> items;
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
        return CardFavoriteItem(
          item: items[index],
        
        );
      },
    );
  }
}

class CardFavoriteItem extends GetView<MyFavoriteControllerImp> {
  const CardFavoriteItem({ super.key, required this.item});
  final MyFavoriteModel item;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // controller.gotoFavoritesDetails(item);
      },
      child: Card(
        child: Padding(
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
                  Text(
                    '${item.itemsPrice}',
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColor),
                  ),
                  const Spacer(),
                  IconButton(
                      onPressed: () {
                      controller.deleteFromFavorite(item.favoriteId!);
                      },
                      icon: Icon(
                        Icons.delete_outline_outlined,
                        color: AppColors.primaryColor,
                      ),
                      )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
