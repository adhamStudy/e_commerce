import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/link_api.dart';

class MyFavoriteData {
  Crud crud;
  MyFavoriteData(this.crud);
  getData(String id) async {
    var response = await Crud().postData(AppLink.myFavorite, {
      'id':id
    });
    return response.fold((l) => l, (r) => r);
  }
  deletefromFavorite(String itemId) async {
    var response = await Crud().postData(AppLink.deleteFromFavorite, {
      
      "item_id": itemId 
    });
    return response.fold((l) => l, (r) => r);
  }

}
