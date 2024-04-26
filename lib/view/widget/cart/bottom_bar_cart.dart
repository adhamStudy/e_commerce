import 'package:e_commerce/controller/cart_controller.dart';
import 'package:e_commerce/core/constants/app_colors.dart';

import 'package:e_commerce/view/widget/auth/custom_button_auth.dart';
import 'package:e_commerce/view/widget/cart/custom_cart_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomBarCart extends GetView<CartControllerImp> {
  const CustomBottomBarCart(
      {super.key,
      required this.price,
      required this.discount,
      required this.shopping,
      required this.totalPrice});
  final String price;
  final String shopping;
  final String totalPrice;
  final int discount;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          controller.couponName == null
              ? Container(
                  width: 159,
                  margin: EdgeInsets.all(5),
                  child: CustomButtonAuth(
                    text: 'Have a coupon ?',
                    onPressed: () {
                      controller.openDialog();
                    },
                  ),
                )
              : Container(
                  width: 159,
                  margin: EdgeInsets.all(5),
                  child: Text('Coupon name: ${controller.couponName}')),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: const Text(
                  'discount',
                  style: TextStyle(fontSize: 22),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  '$discount %',
                  style: const TextStyle(fontSize: 22),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: const Text(
                  'Price',
                  style: TextStyle(fontSize: 22),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  price,
                  style: const TextStyle(fontSize: 22),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: const Text(
                  'shopping',
                  style: TextStyle(fontSize: 22),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  shopping,
                  style: const TextStyle(fontSize: 22),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
            child: Divider(
              height: 2,
              color: AppColors.grey,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: const Text(
                  'Total price',
                  style: TextStyle(
                      fontSize: 22,
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  totalPrice,
                  style: const TextStyle(
                      fontSize: 22,
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const SizedBox(
            height: 20,
          ),
          CusotmButtonCart(
            label: 'CheckOut ',
            onPressed: () {
              controller.gotoPageCheckout();
            },
          ),
        ],
      ),
    );
  }
}
