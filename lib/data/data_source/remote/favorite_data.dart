import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/link_api.dart';

class FavoriteData {
  Crud crud;
  FavoriteData(this.crud);
  addFavorite(String userId,String itemId) async {
    var response = await Crud().postData(AppLink.favoriteAdd, {
      "user_id": userId,
      "item_id": itemId
    });
    return response.fold((l) => l, (r) => r);
  }
  removeFavorite(String userId,String itemId) async {
    var response = await Crud().postData(AppLink.favoriteRemove, {
      "user_id": userId,
      "item_id": itemId
    });
    return response.fold((l) => l, (r) => r);
  }
}
