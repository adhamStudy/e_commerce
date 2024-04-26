import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/link_api.dart';

class ItemsData {
  Crud crud;
  ItemsData(this.crud);
  getData(String id,String usersId) async {
    var response = await Crud().postData(AppLink.items, {
      'id':id,
      'usersid':usersId
    });
    return response.fold((l) => l, (r) => r);
  }

  
  searchData(String search) async {
    var response = await Crud().postData(AppLink.search, {
      'search':search
    });
    return response.fold((l) => l, (r) => r);
  }
}
