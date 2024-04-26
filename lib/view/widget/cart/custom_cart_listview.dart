import 'package:e_commerce/controller/cart_controller.dart';
import 'package:e_commerce/data/model/cart_model.dart';
import 'package:e_commerce/view/widget/cart/custom_cart_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCartListView extends GetView<CartControllerImp> {
  const CustomCartListView({super.key, required this.data});
  final List<CartModel> data;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return CustomCartItem(
          onPressedAdd: () async {
            await controller
                .addItems(controller.data[index].itemsId.toString());
          },
          onPressedRemove: () async {
            await controller
                .removeItems(controller.data[index].itemsId.toString());
          },
          model: data[index],
        );
      },
    );
  }
}
