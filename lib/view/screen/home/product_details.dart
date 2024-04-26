import 'package:e_commerce/controller/products_details_controller/products_details_controller.dart';
import 'package:e_commerce/core/class/handling_data_view.dart';
import 'package:e_commerce/core/constants/app_colors.dart';
import 'package:e_commerce/core/constants/app_routes.dart';
import 'package:e_commerce/view/widget/product_details/price_quantity.dart';
import 'package:e_commerce/view/widget/product_details/sub_items_list.dart';
import 'package:e_commerce/view/widget/product_details/top_product_details_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    ProductDetailsControllerImp controller =
        Get.put(ProductDetailsControllerImp());
    return Scaffold(
      bottomNavigationBar: InkWell(
        onTap: () {
          
          Get.toNamed(AppRoute.cart);
        },
        child: Container(
          alignment: Alignment.center,
          margin:
              const EdgeInsets.only(top: 10, bottom: 20, left: 10, right: 10),
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.primaryColor,
          ),
          child: const Text(
            'Add to Cart',
            style: TextStyle(
                color: AppColors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Container(
        child: ListView(
          children: [
            const TopProductDetailsItem(),
            const SizedBox(
              height: 50,
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    controller.itemsModel.itemsName!,
                    style: const TextStyle(
                        fontSize: 24, color: AppColors.furtherColor),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GetBuilder<ProductDetailsControllerImp>(
                    builder: (controller) {
                      return HandlingDataVeiw(
                        stutusRequest: controller.stutusRequest,
                        widget: PriceQuantity(
                          count: controller.countItems.toString(),
                          price: '${controller.itemsModel.itemsPriceDiscount}\$',
                          onAdd: () {
                            controller.add();
                          },
                          onRemove: () {
                            controller.remove();
                          },
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    controller.itemsModel.itemsDesc!,
                    style: const TextStyle(
                        fontSize: 16,
                        color: AppColors.furtherColor,
                        height: 1.5),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Colors',
                    style: TextStyle(
                        fontSize: 20,
                        color: AppColors.furtherColor,
                        height: 1.5),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SubItemsList(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
