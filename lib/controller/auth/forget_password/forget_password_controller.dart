import 'package:e_commerce/core/class/funcrtions/handlind_data.dart';
import 'package:e_commerce/core/class/stutus_request.dart';
import 'package:e_commerce/core/constants/app_routes.dart';
import 'package:e_commerce/data/data_source/remote/auth/check_email_data.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';

abstract class ForgetPasswordController extends GetxController {
  checkEmail();
}

class ForgetPasswordControllerImpl extends ForgetPasswordController {
  CheckEmailData checkEmailData = CheckEmailData(Get.find());
  late StatusRequest stutusRequest = StatusRequest.initial;

  late TextEditingController emailController;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  checkEmail() async {
    var formdata = formKey.currentState;
    if (formdata!.validate()) {
      stutusRequest = StatusRequest.loading;
      update();
      var response = await checkEmailData.post(
        email: emailController.text,
      );
      print(
          '=========================================================$response');
      stutusRequest = handlingData(response);
      if (StatusRequest.success == stutusRequest) {
        if (response['status'] == 'success') {
          // data.addAll(response['data']);
          Get.offNamed(AppRoute.verifyCode,
              arguments: {'email': emailController.text});
        } else {
          Get.defaultDialog(
              title: 'Warning', middleText: 'Wrong email or password');
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
    // TODO: implement onInit
    emailController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();

    super.dispose();
  }
}
