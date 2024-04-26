import 'package:e_commerce/controller/onboarding_controller.dart';
import 'package:e_commerce/view/widget/onboarding/custom_botton.dart';
import 'package:e_commerce/view/widget/onboarding/dot_controller.dart';
import 'package:e_commerce/view/widget/onboarding/slider_custom.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImpl());
    return const Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Expanded(flex: 2, child: SliderOnboarding()),
          Expanded(
              child: Column(
            children: [
              Spacer(),
              CustomDotControllerOnboarding(),
              Spacer(),
              CustomBottonOnboarding()
            ],
          ))
        ],
      ),
    ));
  }
}
