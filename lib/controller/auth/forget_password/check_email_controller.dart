import 'package:e_commerce/core/constants/app_routes.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:flutter/material.dart';

abstract class CheckEmailController extends GetxController {
  checkEmail();
  goToSuccessSignup();
  late TextEditingController emailController;
}

class CheckEmailControllerImpl extends CheckEmailController {

   GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  checkEmail() {
    var formdata = formKey.currentState;
    if (formdata!.validate()) {
      print('valid');
      goToSuccessSignup();

      // Get.offNamed(AppRoute.home);
    } else {
      print('not valid');
    }
  }

  @override
  goToSuccessSignup() {
    Get.toNamed(AppRoute.verifyCodeSignup);
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
