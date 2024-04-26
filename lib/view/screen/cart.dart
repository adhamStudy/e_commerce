import 'package:e_commerce/controller/cart_controller.dart';
import 'package:e_commerce/core/class/handling_data_view.dart';
import 'package:e_commerce/view/widget/cart/app_bar_cart.dart';
import 'package:e_commerce/view/widget/cart/bottom_bar_cart.dart';
import 'package:e_commerce/view/widget/cart/custom_cart_listview.dart';
import 'package:e_commerce/view/widget/cart/top_cart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {

    Get.lazyPut( ()=> CartControllerImp());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: GetBuilder<CartControllerImp>(
        builder: (controller) {
          return CustomBottomBarCart(
            discount:controller.discount ,
            price: controller.priceOrder.toString(),
            shopping: '200',
            totalPrice: controller.getTotalPrice().toString(),
          );
        },
      ),
      body: GetBuilder<CartControllerImp>(
        builder: (controller) {
          return HandlingDataVeiw(
            stutusRequest: controller.stutusRequest,
            widget: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                const AppBarCart(label: 'My Cart'),
                const SizedBox(
                  height: 10,
                ),
                TopCart(
                  label:
                      'You Have Selected ${controller.countOrder} Item in the List ',
                ),
                Expanded(
                  child: CustomCartListView(data: controller.data),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
