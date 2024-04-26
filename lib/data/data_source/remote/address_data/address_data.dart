import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/link_api.dart';

class AddressData {
  Crud crud;
  AddressData(this.crud);
  addData({required String lat,required String long,required String city,required String street,
  required String name,
      required String userId}) async {
    var response = await Crud().postData(AppLink.addressAdd, {
      'user_id': userId,
      'address_name': name,
      'city': city,
      'lang': long,
      'lat': lat,
      'street': street,
    });
    return response.fold((l) => l, (r) => r);
  }

   viewData(String userId) async {
    var response = await Crud().postData(AppLink.addressView, {
      'user_id': userId,
    
    });
    return response.fold((l) => l, (r) => r);
  }

   deleteData(int addressId) async {
    var response = await Crud().postData(AppLink.addressDelete, {
      'address_id': addressId.toString(),
    
    });
    return response.fold((l) => l, (r) => r);
  }
}
