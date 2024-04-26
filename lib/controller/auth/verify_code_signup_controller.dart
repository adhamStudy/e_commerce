import 'package:e_commerce/core/class/funcrtions/handlind_data.dart';
import 'package:e_commerce/core/class/stutus_request.dart';
import 'package:e_commerce/core/constants/app_routes.dart';
import 'package:e_commerce/data/data_source/remote/auth/verify_code_signup_data.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

abstract class VerifyCodeSignupController extends GetxController {
  checkCode(String verifycode);
  goToSuccessSignup();
}

class VerifyCodeSignupControllerImpl extends VerifyCodeSignupController {
  late StatusRequest stutusRequest = StatusRequest.initial;
  VerifyCodeSignupData verifyCodeData = VerifyCodeSignupData(Get.find());
  @override
  checkCode(verifycode) async {
    stutusRequest = StatusRequest.loading;
    update();
    var response = await verifyCodeData.post(
        email: email.toString(), verifycode: verifycode);
    print('=========================================================$response');
    stutusRequest = handlingData(response);
    if (StatusRequest.success == stutusRequest) {
      if (response['status'] == 'success') {
        // data.addAll(response['data']);
        goToSuccessSignup();
      } else {
        Get.defaultDialog(
            title: 'Warning', middleText: 'Wrong verificaion key ');
        stutusRequest = StatusRequest.failure;
      }
    }
    update();
    print('valid');
  }

  @override
  goToSuccessSignup() {
    Get.offNamed(AppRoute.successSignup);
  }

  late String email;
  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }

  late StatusRequest stutusRequestResendEmail = StatusRequest.initial;
  resendEmail() async {
    stutusRequestResendEmail = StatusRequest.loading;
    var response = await verifyCodeData.resendEmail(email.toString());
    print('=========================================================$response');
    stutusRequestResendEmail = handlingData(response);
    if (StatusRequest.success == stutusRequestResendEmail) {
      if (response['status'] == 'success') {
        // data.addAll(response['data']);
        Get.defaultDialog(
            title: 'Success',
            middleText:
                'Check your mail to see your new verification code \n check also in spam if you didnt find it ');
        stutusRequestResendEmail = StatusRequest.success;
      } else {
        stutusRequestResendEmail = StatusRequest.failure;
      }
    }
    update();
    print('valid');
  }
}
