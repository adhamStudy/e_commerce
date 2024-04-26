import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/link_api.dart';

class VerifyCodeSignupData {
  Crud crud;
  VerifyCodeSignupData(this.crud);
  post({required String email, required String verifycode}) async {
    var response = await Crud().postData(AppLink.verifycode, {
      'email': email,
      'verify_code': verifycode,
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
