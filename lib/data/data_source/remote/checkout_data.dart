import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/link_api.dart';

class CheckoutData {
  Crud crud;
  CheckoutData(this.crud);
  checkoutOrder(var data) async {
    var response = await Crud().postData(AppLink.finishCheckout, data);
    return response.fold((l) => l, (r) => r);
  }

  
}
