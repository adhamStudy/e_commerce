import 'package:e_commerce/core/class/funcrtions/handlind_data.dart';
import 'package:e_commerce/core/class/stutus_request.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:e_commerce/data/data_source/remote/orders_pending_data.dart';
import 'package:e_commerce/data/model/orders/orders_pending_model.dart';
import 'package:get/get.dart';

class OrdersPendingController extends GetxController {
  StatusRequest statusRequest = StatusRequest.initial;

  MyServices myServices = Get.find();
  List<OrderPendingModel> items = [];

  OrdersPendingData pendingData = OrdersPendingData(Get.find());

  getItems() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await pendingData
        .getData(myServices.sharedPreferences.getString('id')!);

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        response['data']
            .map((e) => items.add(OrderPendingModel.fromJson(e)))
            .toList();
        update();
      } else {
        statusRequest = StatusRequest.failure;
      }
          update();
    }

  }

  @override
  void onInit() {
    super.onInit();
    // TODO: implement onInit
    getItems();
    update();
  }
}
