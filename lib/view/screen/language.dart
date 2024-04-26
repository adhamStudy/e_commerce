import 'package:e_commerce/core/constants/app_routes.dart';
import 'package:e_commerce/core/localization/change_local.dart';
import 'package:e_commerce/view/widget/language/custom_botton_lang.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageView extends StatelessWidget {
  LanguageView({super.key});
  // inject language controller
  final LocalController localController = Get.put(LocalController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('1'.tr, style: Theme.of(context).textTheme.displayLarge),
          const SizedBox(
            height: 20,
          ),
          CustomBottonLang(
              textBotton: 'Ar',
              onPressed: () {
                localController.changeLanguage('ar');
                Get.toNamed(AppRoute.onboarding);
              }),
          CustomBottonLang(
              textBotton: 'En',
              onPressed: () {
                localController.changeLanguage('en');
                Get.offNamed(AppRoute.onboarding);

              })
        ],
      ),
    );
  }
}
