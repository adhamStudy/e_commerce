
import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/link_api.dart';

class LoginData {
  Crud crud;
  LoginData(this.crud);
  post({required String password,required String email}) async {
  var response = await Crud().postData(AppLink.login, {
      
      'email': email,
      'password': password,
     
    });
    return response.fold((l) => l, (r) => r);
  }
}
