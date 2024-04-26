import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:e_commerce/controller/auth/verify_code_signup_controller.dart';
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

class VerifyCodeSignupView extends StatelessWidget {
  const VerifyCodeSignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      //
      body: GetBuilder<VerifyCodeSignupControllerImpl>(
        builder: (controller) => controller.stutusRequest ==
                StatusRequest.loading
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
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
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
                          controller.checkCode(verificationCode);
                          // controller.goToSuccessSignup();
                          // controller.();
                          // print(controller.verifyCode);
                        }, // end onSubmit
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      if (controller.stutusRequestResendEmail !=
                          StatusRequest.success)
                        Column(
                          children: [
                            const Text(
                              'didnt recive a code ? ',
                              style: TextStyle(fontSize: 18),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            if (controller.stutusRequestResendEmail !=
                                StatusRequest.loading)
                              ConditionalBuilder(
                                condition: controller.stutusRequest !=
                                    StatusRequest.loading,
                                fallback: (context) =>
                                    const CircularProgressIndicator(),
                                builder: (context) => ElevatedButton(
                                  onPressed: () {
                                    controller.resendEmail();
                                  },
                                  child: const Text('Resend ',
                                      style: TextStyle(fontSize: 18)),
                                ),
                              ),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
