import 'package:e_commerce/controller/auth/signup_controller.dart';
import 'package:e_commerce/controller/auth/verify_code_signup_controller.dart';
import 'package:get/get.dart';

class MyBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignupControllerImpl(),fenix: true);
    Get.lazyPut(() => VerifyCodeSignupControllerImpl(),fenix: true);
  }
}
