import 'package:e_commerce/controller/items_controller.dart';
import 'package:e_commerce/core/class/funcrtions/translate_database.dart';
import 'package:e_commerce/core/constants/app_colors.dart';
import 'package:e_commerce/data/model/categories_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListCategoriesItems extends GetView<ItemsControllerImp> {
  const ListCategoriesItems({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(
          width: 10,
        ),
        physics: const BouncingScrollPhysics(
            decelerationRate: ScrollDecelerationRate.normal),
        scrollDirection: Axis.horizontal,
        itemCount: controller.categories.length,
        itemBuilder: (context, index) {
          return Categories(
            index: index,
            categoriesModel: controller.categories[index],
          );
        },
      ),
    );
  }
}

class Categories extends GetView<ItemsControllerImp> {
  const Categories(
      {super.key, required this.categoriesModel, required this.index});
  final CategoriesModel categoriesModel;
  final int index;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.changeCat(index);
      },
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          GetBuilder<ItemsControllerImp>(
              builder: (controller) => Container(
                    padding:
                        const EdgeInsets.only(bottom: 10, right: 10, left: 10),
                    decoration: controller.selectedCat == index
                        ? const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                  width: 3, color: AppColors.primaryColor),
                            ),
                          )
                        : null,
                    child: Text(
                      '${translateDataBase(categoriesModel.categoriesNameAr, categoriesModel.categoriesName)}',
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.normal),
                    ),
                  ))
        ],
      ),
    );
  }
}
