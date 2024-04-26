import 'package:e_commerce/controller/auth/forget_password/success_reset_password_controller.dart';
import 'package:e_commerce/core/constants/app_colors.dart';
import 'package:e_commerce/view/widget/auth/custom_button_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessResetPassword extends StatelessWidget {
  const SuccessResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    SuccessResetPasswordControllerImpl controller =
        Get.put(SuccessResetPasswordControllerImpl());
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          '',
          style:
              Theme.of(context).textTheme.headlineLarge!.copyWith(fontSize: 26),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: Column(
          children: [
            const Icon(
              Icons.check_circle_outline_rounded,
              size: 200,
              color: Colors.green,
            ),
            const SizedBox(
              height: 20,
            ),
             Center(
              child: Text(
                '37'.tr,
                style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.green),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          const  Spacer(),
            Container(
                width: double.infinity,
                child: CustomButtonAuth(text: '38'.tr, onPressed: () {
                  controller.goToLogin();
                })),
          ],
        ),
      ),
    );
 
  }
}
