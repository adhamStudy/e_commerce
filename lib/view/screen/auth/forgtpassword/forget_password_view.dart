import 'package:e_commerce/controller/auth/forget_password/forget_password_controller.dart';
import 'package:e_commerce/core/class/funcrtions/validate_input.dart';
import 'package:e_commerce/core/class/handling_data_view.dart';
import 'package:e_commerce/core/class/stutus_request.dart';
import 'package:e_commerce/core/constants/app_colors.dart';
import 'package:e_commerce/core/constants/image_asset.dart';
import 'package:e_commerce/view/widget/auth/custom_button_auth.dart';
import 'package:e_commerce/view/widget/auth/custom_text_title.dart';
import 'package:e_commerce/view/widget/auth/custom_textform_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordControllerImpl());
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
        body: GetBuilder<ForgetPasswordControllerImpl>(
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
                            // const LogoAuth(),
                            const SizedBox(
                              height: 30,
                            ),
                            CustomTextTitle(title: '27'.tr),
                            const SizedBox(
                              height: 10,
                            ),

                            const SizedBox(
                              height: 20,
                            ),
                            CustomTextFormAuth(
                              isNumber: false,
                              validator: (p0) {
                                return validInput(p0!, 5, 100, 'email');
                              },
                              hintText: '12'.tr,
                              labelText: 'Email',
                              icon: Icons.email_outlined,
                              controller: controller.emailController,
                            ),
                            const SizedBox(
                              height: 20,
                            ),

                            const SizedBox(
                              height: 20,
                            ),
                            CustomButtonAuth(
                                text: '27'.tr,
                                onPressed: () {
                                  controller.checkEmail();
                                }),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
          },
        ));
  }
}
