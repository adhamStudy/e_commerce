import 'package:e_commerce/core/constants/app_routes.dart';
import 'package:get/get.dart';

abstract class SuccessResetPasswordController extends GetxController {
  goToLogin();
}

class SuccessResetPasswordControllerImpl
    extends SuccessResetPasswordController {
  @override
  goToLogin() {
    Get.offAllNamed(AppRoute.login);
  }
}
