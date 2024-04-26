import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/link_api.dart';

class CartGetItemCount {
  Crud crud;
  CartGetItemCount(this.crud);
  getData(String userId, String itemId) async {
    var response = await Crud().postData(AppLink.cartGetCountItem, {
            "user_id": userId,
      "item_id": itemId

    });
    return response.fold((l) => l, (r) => r);
  }
}
