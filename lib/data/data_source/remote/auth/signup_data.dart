
import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/link_api.dart';

class SignupData {
  Crud crud;
  SignupData(this.crud);
  post({required String username,required String password,required String email,required String phone}) async {
  var response = await Crud().postData(AppLink.signup, {
      'username':username ,
      'password': password,
      'email': email,
      'phone':phone ,
    });
    return response.fold((l) => l, (r) => r);
  }
}
