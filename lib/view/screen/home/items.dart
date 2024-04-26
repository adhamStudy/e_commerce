import 'package:e_commerce/controller/items_controller.dart';
import 'package:e_commerce/core/class/handling_data_view.dart';
import 'package:e_commerce/core/constants/app_routes.dart';
import 'package:e_commerce/core/localization/change_local.dart';
import 'package:e_commerce/view/widget/custom_app_bar.dart';
import 'package:e_commerce/view/widget/home/list_items_search.dart';
import 'package:e_commerce/view/widget/items/card_product_item.dart';
import 'package:e_commerce/view/widget/items/list_categories_items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Items extends GetView<ItemsControllerImp> {
  const Items({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsControllerImp());
    // FavoriteControllerImp favController = Get.put(FavoriteControllerImp());
    Get.lazyPut(() => LocalController());
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: ListView(
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
            const ListCategoriesItems(),
                          GetBuilder<ItemsControllerImp>(
                            builder: (controller) {
                              return HandlingDataVeiw(
                                stutusRequest: controller.stutusRequest,
                                widget:
                                !controller.isSearch ?
                                    CardProductItem(items: controller.items)
                                    :
                                    ListItemsSearch(
                      listDataModel: controller.dataSearch,
                    )
                                    ,
                              );
                            },
                          ),]
        )
      ),
    );
  }
}
