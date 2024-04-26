import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/link_api.dart';

class TestData {
  Crud crud;
  TestData(this.crud);
  getData() async {
    var response = await Crud().postData(AppLink.test, {});
    return response.fold((l) => l, (r) => r);
  }
}
