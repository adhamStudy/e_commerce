import 'package:e_commerce/core/class/funcrtions/handlind_data.dart';
import 'package:e_commerce/core/class/stutus_request.dart';
import 'package:e_commerce/core/constants/app_routes.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:e_commerce/data/data_source/remote/auth/login_data.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';

abstract class LogninController extends GetxController {
  login();
  goToSignup();
  goToForgetPassword();
}

class LogninControllerImpl extends LogninController {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late StatusRequest stutusRequest = StatusRequest.initial;
  LoginData loginData = LoginData(Get.find());
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  MyServices myServices = Get.find();
  @override
  login() async {
    var formdata = formKey.currentState;
    if (formdata!.validate()) {
      stutusRequest = StatusRequest.loading;
      update();
      var response = await loginData.post(
        email: emailController.text,
        password: passwordController.text,
      );
      print(
          '=========================================================$response');
      stutusRequest = handlingData(response);
      if (StatusRequest.success == stutusRequest) {
        if (response['status'] == 'success') {
          // data.addAll(response['data']);
          myServices.sharedPreferences
              .setString('id', response['data']['users_id'].toString());
         String? userId = myServices.sharedPreferences.getString('id');
          myServices.sharedPreferences
              .setString('username', response['data']['users_name']);
          myServices.sharedPreferences
              .setString('email', response['data']['users_email']);
          myServices.sharedPreferences
              .setString('phone', response['data']['users_phone']);
          myServices.sharedPreferences.setString('step', '2');
          FirebaseMessaging.instance.subscribeToTopic('users');
          FirebaseMessaging.instance.subscribeToTopic('users$userId');
          Get.offNamed(AppRoute.homePage);
        } else {
          Get.defaultDialog(
              title: 'Warning', middleText: 'Wrong email or password');
          stutusRequest = StatusRequest.failure;
        }
      }
      update();
      print('valid');
      // Get.offNamed(AppRoute.home);
    } else {
      print('not valid');
    }
  }

  @override
  goToSignup() {
    Get.offNamed(AppRoute.signup);
  }

  @override
  void onInit() {
    super.onInit();
    getToken();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRoute.forgetPassword);
  }

  bool isShowPassword = true;
  void showPassword() {
    isShowPassword = !isShowPassword;
    update();
  }

  void getToken() async {
    String? token = await FirebaseMessaging.instance.getToken();
    print('******************************************Token: $token');
  }
}
