import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/link_api.dart';

class HomeData {
  Crud crud;
  HomeData(this.crud);
  getData() async {
    var response = await Crud().postData(AppLink.home, {});
    return response.fold((l) => l, (r) => r);
  }

  searchData(String search) async {
    var response = await Crud().postData(AppLink.search, {
      'search':search
    });
    return response.fold((l) => l, (r) => r);
  }
}
