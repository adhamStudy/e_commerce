import 'package:e_commerce/controller/auth/forget_password/reset_password_controller.dart';
import 'package:e_commerce/core/class/funcrtions/validate_input.dart';
import 'package:e_commerce/core/class/handling_data_view.dart';
import 'package:e_commerce/core/class/stutus_request.dart';
import 'package:e_commerce/core/constants/app_colors.dart';
import 'package:e_commerce/core/constants/image_asset.dart';
import 'package:e_commerce/view/widget/auth/custom_button_auth.dart';
import 'package:e_commerce/view/widget/auth/custom_text_suptitle.dart';
import 'package:e_commerce/view/widget/auth/custom_text_title.dart';
import 'package:e_commerce/view/widget/auth/custom_textform_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ResetPasswordControllerImpl());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.backgroundColor,
          elevation: 0,
          centerTitle: true,
          title: Text(
            '',
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(fontSize: 26),
          ),
        ),
        body: GetBuilder<ResetPasswordControllerImpl>(
          builder: (controller) {
            return controller.stutusRequest == StatusRequest.loading
                ? Center(
                    child: Lottie.asset(
                      ImageAsset.loading,
                      width: 250,
                      height: 250,
                    ),
                  )
                : HandlingDataRequest(
                    stutusRequest: controller.stutusRequest,
                    widget: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 30),
                      child: Form(
                        key: controller.formKey,
                        child: ListView(
                          children: [
                            const SizedBox(height: 30),
                            CustomTextTitle(title: '35'.tr),
                            const SizedBox(height: 10),
                            CustomTextSuptitle(title: '34'.tr),
                            const SizedBox(height: 20),
                            CustomTextFormAuth(
                              isNumber: false,
                              validator: (value) {
                                controller.passwordController.text = value!;
                                if (controller.passwordController.text ==
                                    controller.rePasswordController.text) {
                                  return null;
                                } else {
                                  return 'doesnt match';
                                }
                              },
                              hintText: '13'.tr,
                              labelText: 'Password',
                              icon: Icons.lock_outline,
                              controller: controller.passwordController,
                            ),
                            const SizedBox(height: 20),
                            CustomTextFormAuth(
                              isNumber: false,
                              validator: (value) {
                                controller.rePasswordController.text = value!;
                                if (controller.passwordController.text ==
                                    controller.rePasswordController.text) {
                                  return validInput(value, 5, 30, 'password');
                                } else {
                                  return 'doesnt match';
                                }
                              },
                              hintText: '35'.tr,
                              labelText: 'Confirm Password',
                              icon: Icons.lock_outline,
                              controller: controller.rePasswordController,
                            ),
                            const SizedBox(height: 20),
                            CustomButtonAuth(
                              text: '33'.tr,
                              onPressed: () {
                                controller.checkPassword();
                              },
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),
                  );
          },
        ));
  }
}
