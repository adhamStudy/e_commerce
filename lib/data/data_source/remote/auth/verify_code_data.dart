
import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/link_api.dart';

class VerifyCodeData {
  Crud crud;
  VerifyCodeData(this.crud);
  post({required String email,required String verifycode}) async {
  var response = await Crud().postData(AppLink.verifycodeResetPassword, {
      'email': email,
      'verifycode':verifycode
     
    });
    return response.fold((l) => l, (r) => r);
  }

  resendEmail( String email) async {
  var response = await Crud().postData(AppLink.resendUserVerifyCode, {
      'email': email,

     
    });
    return response.fold((l) => l, (r) => r);
  }

}
