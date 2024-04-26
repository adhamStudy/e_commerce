
import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/link_api.dart';

class ResetPasswordData {
  Crud crud;
  ResetPasswordData(this.crud);
  post({required String email,required String password}) async {
  var response = await Crud().postData(AppLink.resetPassword, {
      'email': email,
      'password':password
     
    });
    return response.fold((l) => l, (r) => r);
  }
}
