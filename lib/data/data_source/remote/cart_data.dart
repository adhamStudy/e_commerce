import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/link_api.dart';

class CartData {
  Crud crud;
  CartData(this.crud);
  addCart(String userId,String itemId) async {
    var response = await Crud().postData(AppLink.cartAdd, {
      "user_id": userId,
      "item_id": itemId
    });
    return response.fold((l) => l, (r) => r);
  }
  removeCart(String userId,String itemId) async {
    var response = await Crud().postData(AppLink.cartRemove, {
      "user_id": userId,
      "item_id": itemId
    });
    return response.fold((l) => l, (r) => r);
  }
  getCountItem(String userId, String itemId) async {
    var response = await Crud().postData(AppLink.cartGetCountItem, {
            "user_id": userId,
      "item_id": itemId

    });
    return response.fold((l) => l, (r) => r);
  }
  viewCart(String userId) async {
    var response = await Crud().postData(AppLink.cartView, {
            "user_id": userId
      

    });
    return response.fold((l) => l, (r) => r);
  }
  checkCoupon(String couponName) async {
    var response = await Crud().postData(AppLink.checkCoupon, {
            "coupon_name": couponName
      

    });
    return response.fold((l) => l, (r) => r);
  }
}
