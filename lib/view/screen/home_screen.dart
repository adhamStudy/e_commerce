
import 'package:e_commerce/controller/home_screen_controller.dart';
import 'package:e_commerce/core/constants/app_colors.dart';
import 'package:e_commerce/core/constants/app_routes.dart';
import 'package:e_commerce/view/widget/home/bottom_app_bar/custom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());

    return GetBuilder<HomeScreenControllerImp>(
      builder: (controller) {
        return Scaffold(
            body: controller.listPage[controller.currentIndex],
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: FloatingActionButton(
              backgroundColor: AppColors.primaryColor,
              onPressed: () {
                Get.toNamed(AppRoute.cart);
              },
              child: const Icon(
                Icons.shopping_cart_outlined,
                color: AppColors.black,
              ),
            ),
            bottomNavigationBar: const CustomBottomAppBarHome());
      },
    );
  }
}
