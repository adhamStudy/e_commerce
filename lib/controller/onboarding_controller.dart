import 'package:e_commerce/core/constants/app_routes.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class OnBoardingController extends GetxController {
  next();
  onPagaeChanged(int index);
}

class OnBoardingControllerImpl extends OnBoardingController {
  int curentIndex = 0;
  MyServices myServices = Get.find();
  @override
  next() {
    curentIndex++;
    if (curentIndex <= 2) {
      pageController.animateToPage(curentIndex,
          duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
    } else {
      myServices.sharedPreferences.setString('step', '1');
      Get.offAllNamed(AppRoute.login);
    }
  }

  late PageController pageController = PageController();
  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }

  @override
  onPagaeChanged(int index) {
    curentIndex = index;
    update();
  }
}
