import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/link_api.dart';

class OrdersPendingData {
  Crud crud;
  OrdersPendingData(this.crud);
  getData(String id) async {
    var response = await Crud().postData(AppLink.ordersPending, {
      'id':id
    });
    return response.fold((l) => l, (r) => r);
  }
}
