import 'package:e_commerce/controller/home_controller/home_controller.dart';
import 'package:e_commerce/core/class/handling_data_view.dart';
import 'package:e_commerce/core/constants/app_routes.dart';
import 'package:e_commerce/core/localization/change_local.dart';
import 'package:e_commerce/view/widget/custom_app_bar.dart';
import 'package:e_commerce/view/widget/home/custom_card_home.dart';
import 'package:e_commerce/view/widget/home/custom_title_home.dart';
import 'package:e_commerce/view/widget/home/list_categories_home.dart';
import 'package:e_commerce/view/widget/home/list_items_home.dart';
import 'package:e_commerce/view/widget/home/list_items_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    Get.lazyPut(
      () => LocalController(),
    );
    return GetBuilder<HomeControllerImp>(
      builder: ((controller) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              CustomAppBar(
                mycontroller: controller.search!,
                onChanged: (p0) {
                  controller.checkSearch(p0);
                },
                onPressedfav: () {
                  Get.toNamed(AppRoute.myFavorite);
                },
                title: '44'.tr,
                onPressedSearch: () {
                  controller.onSearchItems();
                },
                // onPressedIcon: () {}
              ),
              HandlingDataVeiw(stutusRequest: controller.stutusRequest,
              widget: 
              !controller.isSearch
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CusotmCardHome(
                            title: 'summer offer ', subTitle: 'Cachback 20%'),
                        CustomTitle(title: '43'.tr),
                        const ListCategoriesHome(),
                        CustomTitle(title: '45'.tr),
                        const ListItemsHome(),
                      ],
                    )
                  : ListItemsSearch(
                      listDataModel: controller.dataSearch,
                    )
              ,
              )
            ],
          ),
        );
      }),
    );
  }
}
