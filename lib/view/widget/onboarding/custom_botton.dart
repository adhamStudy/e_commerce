import 'package:e_commerce/controller/onboarding_controller.dart';
import 'package:e_commerce/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CustomBottonOnboarding extends GetView<OnBoardingControllerImpl> {
  const CustomBottonOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      height: 40,
      color: AppColors.primaryColor,
      child: MaterialButton(
        padding: const EdgeInsets.symmetric(horizontal: 100),
        onPressed: () {
          controller.next();
        },
        child:  Text(
          '8'.tr,
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
