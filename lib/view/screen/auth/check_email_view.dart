import 'package:e_commerce/controller/auth/forget_password/check_email_controller.dart';
import 'package:e_commerce/core/class/funcrtions/validate_input.dart';
import 'package:e_commerce/core/constants/app_colors.dart';
import 'package:e_commerce/view/widget/auth/custom_button_auth.dart';
import 'package:e_commerce/view/widget/auth/custom_text_title.dart';
import 'package:e_commerce/view/widget/auth/custom_textform_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckEmailView extends StatelessWidget {
  const CheckEmailView({super.key});
  @override
  Widget build(BuildContext context) {
    CheckEmailControllerImpl controller = Get.put(CheckEmailControllerImpl());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Signup check email',
          style:
              Theme.of(context).textTheme.headlineLarge!.copyWith(fontSize: 26),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: Form(
          key: controller.formKey,
          child: ListView(
            children: [
              // const LogoAuth(),
              const SizedBox(
                height: 30,
              ),
              const CustomTextTitle(title: 'Success Sign up'),
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
                hintText: 'Enter Your Email',
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
                  text: 'Verify Email',
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
  }
}
