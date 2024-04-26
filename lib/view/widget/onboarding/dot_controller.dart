import 'package:e_commerce/controller/onboarding_controller.dart';
import 'package:e_commerce/core/constants/app_colors.dart';
import 'package:e_commerce/data/data_source/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class CustomDotControllerOnboarding extends StatelessWidget {
  const CustomDotControllerOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerImpl>(
        builder: (controller) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                  onBoadingList.length,
                  (index) => AnimatedContainer(
                    margin: const EdgeInsets.only(right: 10),
                    duration: const Duration(milliseconds: 500),
                    width: controller.curentIndex == index ? 20 : 6,
                    height: 6,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                )
              ],
            ));
  }
}
