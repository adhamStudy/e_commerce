import 'package:e_commerce/controller/home_controller/home_controller.dart';
import 'package:e_commerce/core/class/funcrtions/translate_database.dart';
import 'package:e_commerce/core/constants/app_colors.dart';
import 'package:e_commerce/data/model/categories_model.dart';
import 'package:e_commerce/link_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ListCategoriesHome extends GetView<HomeControllerImp> {
  const ListCategoriesHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
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

class Categories extends GetView<HomeControllerImp> {
  const Categories(
      {super.key, required this.categoriesModel, required this.index});
  final CategoriesModel categoriesModel;
  final int index;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.gotoItems(controller.categories,index);
      },
      child: Column(
        children: [
          Container(
            width: 65,
            height: 65,
            decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(15)),
            child: SvgPicture.network(
              '${AppLink.imageStatic}/categories/${categoriesModel.categoriesImage}',
              width: 50,
              height: 50,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            '${translateDataBase(categoriesModel.categoriesNameAr, categoriesModel.categoriesName)}'
            )
        ],
      ),
    );
  }
}
