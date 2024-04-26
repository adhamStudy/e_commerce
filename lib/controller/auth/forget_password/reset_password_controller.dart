import 'package:e_commerce/core/class/funcrtions/handlind_data.dart';
import 'package:e_commerce/core/class/stutus_request.dart';
import 'package:e_commerce/core/constants/app_routes.dart';
import 'package:e_commerce/data/data_source/remote/auth/reset_password_data.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';

abstract class ResetPasswordController extends GetxController {
  checkPassword();
  goToSuccessLogin();
  late TextEditingController passwordController;
  late TextEditingController rePasswordController;
}

class ResetPasswordControllerImpl extends ResetPasswordController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late StatusRequest stutusRequest = StatusRequest.initial;
  ResetPasswordData resetPasswordData = ResetPasswordData(Get.find());
  String? email;
  @override
  checkPassword() async {
    var formdata = formKey.currentState;
    if (formdata!.validate()) {
      stutusRequest = StatusRequest.loading;
      update();
      var response = await resetPasswordData.post(
          email: email.toString(), password: passwordController.text);
      print(
          '=========================================================$response');
      stutusRequest = handlingData(response);
      if (StatusRequest.success == stutusRequest) {
        if (response['status'] == 'success') {
          // data.addAll(response['data']);
          goToSuccessLogin();
        } else {
          Get.defaultDialog(
              title: 'Warning', middleText: 'Wrong verificaion key ');
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
  goToSuccessLogin() {
    Get.toNamed(AppRoute.successReset);
  }

  @override
  void onInit() {
    super.onInit();
    // TODO: implement onInit
    rePasswordController = TextEditingController();
    passwordController = TextEditingController();
    email = Get.arguments['email'];
  }

  @override
  void dispose() {
    passwordController.dispose();
    rePasswordController.dispose();

    super.dispose();
  }
}
