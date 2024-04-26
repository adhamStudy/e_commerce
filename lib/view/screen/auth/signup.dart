import 'package:e_commerce/controller/auth/signup_controller.dart';
import 'package:e_commerce/core/class/funcrtions/alert_exit_app.dart';
import 'package:e_commerce/core/class/funcrtions/validate_input.dart';
import 'package:e_commerce/core/class/handling_data_view.dart';
import 'package:e_commerce/core/class/stutus_request.dart';
import 'package:e_commerce/core/constants/app_colors.dart';
import 'package:e_commerce/core/constants/image_asset.dart';
import 'package:e_commerce/view/widget/auth/custem_text_signup_login.dart';
import 'package:e_commerce/view/widget/auth/custom_button_auth.dart';
import 'package:e_commerce/view/widget/auth/custom_text_suptitle.dart';
import 'package:e_commerce/view/widget/auth/custom_text_title.dart';
import 'package:e_commerce/view/widget/auth/custom_textform_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class Signupview extends StatelessWidget {
  const Signupview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.backgroundColor,
          elevation: 0,
          centerTitle: true,
          title: Text(
            '17'.tr,
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(fontSize: 26),
          ),
        ),
        body: GetBuilder<SignupControllerImpl>(builder: (controller) {
          return controller.stutusRequest == StatusRequest.loading
              ? Center(
                  child: Lottie.asset(
                    ImageAsset.loading,
                    width: 250,
                    height: 250,
                  ),
                )
              : WillPopScope(
                  onWillPop: alertExitApp,
                  child: HandlingDataRequest(
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
                            CustomTextTitle(title: '10'.tr),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomTextSuptitle(title: '24'.tr),
                            const SizedBox(
                              height: 65,
                            ),
                            CustomTextFormAuth(
                              isNumber: false,
                              validator: (p0) {
                                return validInput(p0!, 5, 30, 'name');
                              },
                              hintText: '20'.tr,
                              labelText: 'username',
                              icon: Icons.person_2_outlined,
                              controller: controller.usernameController,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            CustomTextFormAuth(
                              isNumber: false,
                              validator: (p0) {
                                return validInput(p0!, 5, 100, 'email');
                              },
                              hintText: '18'.tr,
                              labelText: 'Email',
                              icon: Icons.email_outlined,
                              controller: controller.emailController,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            CustomTextFormAuth(
                              isNumber: true,
                              validator: (p0) {
                                return validInput(p0!, 5, 100, 'phone');
                              },
                              hintText: '21'.tr,
                              labelText: 'phone',
                              icon: Icons.phone_outlined,
                              controller: controller.phoneController,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            CustomTextFormAuth(
                              isNumber: false,
                              onTapIcon: () {
                                controller.showPassword();
                              },
                              absureText: controller.isShowPassword,
                              validator: (p0) {
                                return validInput(p0!, 5, 30, 'passeord');
                              },
                              hintText: '19'.tr,
                              labelText: 'Password',
                              icon: Icons.lock_outline,
                              controller: controller.passwordController,
                            ),
                            const SizedBox(
                              height: 20,
                            ),

                            const SizedBox(
                              height: 20,
                            ),
                            CustomButtonAuth(
                                text: '17'.tr,
                                onPressed: () {
                                  controller.signup();
                                  // Get.offNamed(AppRoute.checkEmail);
                                }),
                            const SizedBox(
                              height: 20,
                            ),
                            CustomTextSignupLogin(
                                textOne: '25'.tr,
                                textTow: '15'.tr,
                                onPressed: () {
                                  controller.goTologin();
                                })
                          ],
                        ),
                      ),
                    ),
                  ));
        }));
  }
}
