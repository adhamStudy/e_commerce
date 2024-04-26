import 'package:e_commerce/core/class/funcrtions/handlind_data.dart';
import 'package:e_commerce/core/class/stutus_request.dart';
import 'package:e_commerce/core/constants/app_routes.dart';
import 'package:e_commerce/data/data_source/remote/auth/signup_data.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:flutter/material.dart';

abstract class SignupController extends GetxController {
  signup();
  goTologin();
}

class SignupControllerImpl extends SignupController {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController phoneController;
  late TextEditingController usernameController;
  late StatusRequest stutusRequest = StatusRequest.initial;
  SignupData signupData = SignupData(Get.find());

  List data = [];
  @override
  goTologin() {
    Get.offNamed(AppRoute.login);
  }

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  signup() async {
    var formdata = formKey.currentState;
    if (formdata!.validate()) {
      stutusRequest = StatusRequest.loading;
      update();
      var response = await signupData.post(
          email: emailController.text,
          password: passwordController.text,
          username: usernameController.text,
          phone: phoneController.text);
      print(
          '=========================================================$response');
      stutusRequest = handlingData(response);
      if (StatusRequest.success == stutusRequest) {
        if (response['status'] == 'success') {
          // data.addAll(response['data']);
          Get.offNamed(AppRoute.verifyCodeSignup,
              arguments: {'email': emailController.text});
        } else {
          Get.defaultDialog(
              title: 'Warning', middleText: 'Email or phone already exists');
          stutusRequest = StatusRequest.failure;
        }
      }
      update();
      print('valid');
    } else {
      print('not valid');
    }
  }

  @override
  void onInit() {
    super.onInit();

    emailController = TextEditingController();
    usernameController = TextEditingController();
    phoneController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    phoneController.dispose();
    usernameController.dispose();
    super.dispose();
  }

  bool isShowPassword = true;
  void showPassword() {
    isShowPassword = !isShowPassword;
    update();
  }
}
