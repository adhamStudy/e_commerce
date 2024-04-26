import 'package:e_commerce/controller/auth/login_controller.dart';
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
import 'package:e_commerce/view/widget/auth/logo_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LogninControllerImpl());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          '9'.tr,
          style:
              Theme.of(context).textTheme.headlineLarge!.copyWith(fontSize: 26),
        ),
      ),
      body: WillPopScope(
          onWillPop: alertExitApp,
          child: GetBuilder<LogninControllerImpl>(
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
                              const LogoAuth(),
                              const SizedBox(
                                height: 30,
                              ),
                              CustomTextTitle(title: '10'.tr),
                              const SizedBox(
                                height: 10,
                              ),
                              CustomTextSuptitle(title: '11'.tr),
                              const SizedBox(
                                height: 65,
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
                              GetBuilder<LogninControllerImpl>(
                                builder: (controller) => CustomTextFormAuth(
                                  absureText: controller.isShowPassword,
                                  onTapIcon: () {
                                    controller.showPassword();
                                  },
                                  isNumber: false,
                                  validator: (p0) {
                                    return validInput(p0!, 5, 30, 'passeord');
                                  },
                                  hintText: '13'.tr,
                                  labelText: 'Password',
                                  icon: Icons.remove_red_eye_outlined,
                                  controller: controller.passwordController,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              InkWell(
                                onTap: () {
                                  controller.goToForgetPassword();
                                },
                                child: Text(
                                  '14'.tr,
                                  textAlign: TextAlign.end,
                                  style: const TextStyle(
                                    color: AppColors.grey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              CustomButtonAuth(
                                  text: '15'.tr,
                                  onPressed: () {
                                    controller.login();
                                  }),
                              const SizedBox(
                                height: 20,
                              ),
                              CustomTextSignupLogin(
                                  textOne: '16'.tr,
                                  textTow: '17'.tr,
                                  onPressed: () {
                                    controller.goToSignup();
                                  })
                            ],
                          ),
                        ),
                      ));
            },
          )),
    );
  }
}
