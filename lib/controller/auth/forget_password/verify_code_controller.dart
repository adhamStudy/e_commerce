import 'package:e_commerce/core/class/funcrtions/handlind_data.dart';
import 'package:e_commerce/core/class/stutus_request.dart';
import 'package:e_commerce/core/constants/app_routes.dart';
import 'package:e_commerce/data/data_source/remote/auth/verify_code_data.dart';
import 'package:get/get.dart';

abstract class VerifyCodeController extends GetxController {
  checkCode(String verifycode);
  goToResetPassword();
}

class VerifyCodeControllerImpl extends VerifyCodeController {
  String? email;
  late StatusRequest stutusRequest = StatusRequest.initial;
  VerifyCodeData verifyCodeData = VerifyCodeData(Get.find());
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
        goToResetPassword();
      } else {
        Get.defaultDialog(
            title: 'Warning', middleText: 'Wrong verificaion key ');
        stutusRequest = StatusRequest.failure;
      }
    }
    update();
    print('valid');
  }

  late String verifyCode;
  @override
  goToResetPassword() {
    Get.offNamed(AppRoute.resetPassword, arguments: {'email': email});
  }

  @override
  void onInit() {
    super.onInit();
    email = Get.arguments['email'];
  }


  resendEmail() async {
    stutusRequest = StatusRequest.loading;
    var response = await verifyCodeData.resendEmail(email.toString());
    print('=========================================================$response');
    stutusRequest = handlingData(response);
    if (StatusRequest.success == stutusRequest) {
      if (response['status'] == 'success') {
        // data.addAll(response['data']);
        Get.defaultDialog(
            title: 'Success',
            middleText:
                'Check your mail to see your new verification code \nalso check in spam if you didnt find it ');
        stutusRequest = StatusRequest.success;
      } else {
        stutusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
