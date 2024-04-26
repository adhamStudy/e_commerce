import 'package:e_commerce/core/class/funcrtions/handlind_data.dart';
import 'package:e_commerce/core/class/stutus_request.dart';
import 'package:e_commerce/data/data_source/remote/test_data.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class TestController extends GetxController {
  TestData testData = TestData(Get.find());

  List data = [];
  late StatusRequest stutusRequest;
  getData() async {
    stutusRequest = StatusRequest.loading;
    var response = await testData.getData();
    print('=========================================================$response');
    stutusRequest = handlingData(response);
    if (StatusRequest.success == stutusRequest) {
      if (response['status'] == 'success') {
        data.addAll(response['data']);
      } else {
        stutusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();

    getData();
  }
}
