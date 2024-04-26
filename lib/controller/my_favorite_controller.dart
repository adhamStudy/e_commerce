import 'package:e_commerce/core/class/funcrtions/handlind_data.dart';
import 'package:e_commerce/core/class/stutus_request.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:e_commerce/data/data_source/remote/myfavorite_data.dart';
import 'package:e_commerce/data/model/my_favorite_model.dart';
import 'package:get/get.dart';

abstract class MyFavoriteController extends GetxController {}

class MyFavoriteControllerImp extends MyFavoriteController {
  Map isFavorite = {};
  MyServices myServices = Get.find();
  MyFavoriteData favoriteData = MyFavoriteData(Get.find());

  List<MyFavoriteModel> data = [];
  late StatusRequest stutusRequest;
  getData() async {
    stutusRequest = StatusRequest.loading;
    var response = await favoriteData
        .getData(myServices.sharedPreferences.getString('id')!.toString());
    print('=========================================================$response');
    stutusRequest = handlingData(response);
    if (StatusRequest.success == stutusRequest) {
      if (response['status'] == 'success') {
        response['data']
            .map((e) => data.add(MyFavoriteModel.fromJson(e)))
            .toList();
      } else {
        stutusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  deleteFromFavorite(int favoriteId) {
    // data.clear();

    favoriteData.deletefromFavorite(favoriteId.toString());

    data.removeWhere((element) => element.favoriteId == favoriteId);
    if (data.isEmpty) {
      stutusRequest = StatusRequest.failure;
    }

    update();
  }
}
