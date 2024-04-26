
import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/link_api.dart';

class CheckEmailData {
  Crud crud;
  CheckEmailData(this.crud);
  post({required String email}) async {
  var response = await Crud().postData(AppLink.checkEmail, {
      
      'email': email,

     
    });
    return response.fold((l) => l, (r) => r);
  }
}
