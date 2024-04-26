import 'package:e_commerce/core/constants/app_routes.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

abstract class SuccessSignupController extends GetxController {
  goToLogin();
}

class SuccessSignupControllerImpl
    extends SuccessSignupController {
  @override
  goToLogin() {
    Get.offAllNamed(AppRoute.login);
  }
}
