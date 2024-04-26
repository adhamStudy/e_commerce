import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:e_commerce/controller/auth/forget_password/verify_code_controller.dart';
import 'package:e_commerce/core/class/handling_data_view.dart';
import 'package:e_commerce/core/class/stutus_request.dart';
import 'package:e_commerce/core/constants/app_colors.dart';
import 'package:e_commerce/core/constants/image_asset.dart';
import 'package:e_commerce/view/widget/auth/custom_text_suptitle.dart';
import 'package:e_commerce/view/widget/auth/custom_text_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class VerifyCodedView extends StatelessWidget {
  const VerifyCodedView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(VerifyCodeControllerImpl());
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
        body: GetBuilder<VerifyCodeControllerImpl>(
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
                      child: ListView(
                        children: [
                          // const LogoAuth(),
                          const SizedBox(
                            height: 30,
                          ),
                          const CustomTextTitle(title: 'Verification Code'),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomTextSuptitle(title: '29'.tr),
                          const SizedBox(
                            height: 20,
                          ),
                          OtpTextField(
                            borderRadius: BorderRadius.circular(15),
                            fieldWidth: 50,
                            numberOfFields: 5,
                            borderColor: AppColors.primaryColor,
                            //set to true to show as box or false to show as dash
                            showFieldAsBox: true,
                            //runs when a code is typed in
                            onCodeChanged: (String code) {
                              //handle validation or checks here
                            },
                            //runs when every textfield is filled
                            onSubmit: (String verificationCode) {
                              controller.verifyCode = verificationCode;
                              controller.checkCode(verificationCode);
                            }, // end onSubmit
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          if (controller.stutusRequest !=
                              StatusRequest.success)
                            ConditionalBuilder(
                              fallback: (context) =>
                                  const CircularProgressIndicator(),
                              condition: controller.stutusRequest !=
                                  StatusRequest.loading,
                              builder: (context) => Column(
                                children: [
                                  const Text(
                                    'didnt recive a code ? ',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      controller.resendEmail();
                                    },
                                    child: const Text('Resend ',
                                        style: TextStyle(fontSize: 18)),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                  );
          },
        ));
  }
}
