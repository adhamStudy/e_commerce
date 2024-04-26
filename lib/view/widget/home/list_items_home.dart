import 'package:e_commerce/controller/home_controller/home_controller.dart';
import 'package:e_commerce/core/class/funcrtions/translate_database.dart';
import 'package:e_commerce/core/constants/app_colors.dart';
import 'package:e_commerce/data/model/items_model.dart';
import 'package:e_commerce/link_api.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ListItemsHome extends GetView<HomeControllerImp> {
  const ListItemsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        separatorBuilder: (context, index) => const SizedBox(
          width: 10,
        ),
        itemCount: controller.items.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return SizedBox(
              height: 180,
              child: ItemsHome(itemsModel: controller.items[index]));
        },
      ),
    );
  }
}

class ItemsHome extends StatelessWidget {
  const ItemsHome({super.key, required this.itemsModel});
  final ItemsModel itemsModel;
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        height: 160,
        width: 200,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: AppColors.primaryColor.withOpacity(0.2)),
      ),
      Positioned(
        bottom: 20,
        child: Container(
          width: 200,
          child: Image.network(
            '${AppLink.imageItems}/${itemsModel.itemsImage}',
            height: 120,
            width: 140,
          ),
        ),
      ),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
        child: Text(
          '${translateDataBase(itemsModel.itemsNameAr, itemsModel.itemsName)}',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: AppColors.black,
            shadows: [],
          ),
        ),
      ),
      Positioned(
        right: 0,
        top: 10,
        child: Container(
          color: Colors.red,
          child: Text(
            'Discount ${itemsModel.itemsDiscount} %',
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    ]);
  }
}
