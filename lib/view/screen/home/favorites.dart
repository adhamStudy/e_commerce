import 'package:e_commerce/controller/my_favorite_controller.dart';
import 'package:e_commerce/core/class/handling_data_view.dart';
import 'package:e_commerce/view/widget/favorite/custom_favorite.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyFavorite extends StatelessWidget {
  const MyFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyFavoriteControllerImp());

    return Scaffold(
      body: Container(
          padding: EdgeInsets.all(15),
          child: GetBuilder<MyFavoriteControllerImp>(
            builder: (controller) {
              return ListView(
                children: [
                  // CustomAppBar(
                  //     onPressedfav: () {
                  //       // Get.toNamed(AppRoute.myFavorite);
                  //     },
                  //     title: '44'.tr,
                  //     onPressedSearch: () {},
                  //     // onPressedIcon: () {}
                  //     ),
                  HandlingDataVeiw(
                      stutusRequest: controller.stutusRequest,
                      widget: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 0.7),
                        itemCount: controller.data.length,
                        itemBuilder: (context, index) {
                          return CardFavoriteItem(
                            item: controller.data[index],
                          );
                        },
                      ))
                ],
              );
            },
          )),
    );
  }
}
