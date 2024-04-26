import 'package:e_commerce/controller/onboarding_controller.dart';
import 'package:e_commerce/core/constants/app_colors.dart';
import 'package:e_commerce/data/data_source/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SliderOnboarding extends GetView<OnBoardingControllerImpl> {
  const SliderOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      physics: const BouncingScrollPhysics(),
      controller: controller.pageController,
      onPageChanged: (value) {
        controller.onPagaeChanged(value);
      },
      itemCount: 3,
      itemBuilder: (context, index) => Column(children: [
        const SizedBox(
          height: 40,
        ),
        Text(
          onBoadingList[index].title!,
          style: GoogleFonts.cairo(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: AppColors.black,
          ),
        ),
        const SizedBox(height: 20),
        Image.asset(onBoadingList[index].image!, width: Get.width / 1.9),
        const SizedBox(height: 80),
        Container(
          width: double.infinity,
          alignment: Alignment.center,
          child: Text(
            textAlign: TextAlign.center,
            onBoadingList[index].body!,
            // ignore: prefer_const_constructors
            style: GoogleFonts.cairo(
              fontSize: 16,
              color: AppColors.grey,
            ),
          ),
        ),
      ]),
    );
  }
}
