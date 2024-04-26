import 'package:e_commerce/core/class/funcrtions/handlind_data.dart';
import 'package:e_commerce/core/class/stutus_request.dart';
import 'package:e_commerce/core/constants/app_routes.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:e_commerce/data/data_source/remote/address_data/address_data.dart';
import 'package:e_commerce/data/data_source/remote/checkout_data.dart';
import 'package:e_commerce/data/model/address_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CheckoutController extends GetxController {
  AddressData addressData = Get.put(AddressData(Get.find()));
  CheckoutData checkoutData = Get.put(CheckoutData(Get.find()));

  MyServices myServices = Get.find();

  StatusRequest statusRequest = StatusRequest.initial;
  int ?discount  ;
  String? paymentMethod;
  String? deliveryType;
  String? addressid = '0';
  int? couponId;
  double? priceOrder;
  List<AddressModel> dataaddress = [];

  choosePaymentMethod(String val) {
    paymentMethod = val;
    update();
  }

  chooseDeliveryType(String val) {
    deliveryType = val;
    update();
  }

  chooseShippingAddress(String val) {
    addressid = val;
    update();
  }

  getShippingAddress() async {
    statusRequest = StatusRequest.loading;

    var response = await addressData
        .viewData(myServices.sharedPreferences.getString("id")!);

    print("=============================== Controller $response ");

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        List listdata = response['data'];
        dataaddress.addAll(listdata.map((e) => AddressModel.fromJson(e)));
        update();
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  checkoutOrder() async {
    if (paymentMethod == null) {
      return Get.snackbar('Error', 'Choose a payment method');
    }
    if (deliveryType == null) {
      return Get.snackbar('Error', 'Choose an address');
    }

    statusRequest = StatusRequest.loading;
    update();
    var data = {
      'user_id': myServices.sharedPreferences.getString('id'),
      'address_id': addressid.toString(),
      'orders_type': deliveryType,
      'price_delivery': 40.toString(),
      'orders_price': priceOrder.toString(),
      'coupon_id': couponId.toString(),
      'payment_method': paymentMethod.toString(),
      'discount':discount.toString()
    };
    var response = await checkoutData.checkoutOrder(data);
    print('=========================================================$response');
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        Get.offAllNamed(AppRoute.homePage);
        return Get.snackbar('success', 'order done successfully');
      } else {
        return Get.snackbar('Error', 'Try again');
      }
    }
    update();
  }

  @override
  void onInit() {
    couponId = Get.arguments['couponid'];
    priceOrder = Get.arguments['priceorder'];
    discount = Get.arguments['discount'];
    getShippingAddress();
    super.onInit();
  }

  void test() async {
    var headersList = {
      'Accept': '*/*',
      'User-Agent': 'Thunder Client (https://www.thunderclient.com)'
    };
    var url = Uri.parse(
        'https://phptrain.u4e.net/ecommerce_flutter/orders/checkout.php');

    var body = {
      'user_id': '10',
      'address_id': '4',
      'orders_type': '0',
      'price_delivery': '40',
      'orders_price': '1206',
      'coupon_id': '0',
      'payment_method': '0'
    };

    var req = http.MultipartRequest('POST', url);
    req.headers.addAll(headersList);
    req.fields.addAll(body);

    var res = await req.send();
    final resBody = await res.stream.bytesToString();

    if (res.statusCode >= 200 && res.statusCode < 300) {
      print(resBody);
    } else {
      print(res.reasonPhrase);
    }
  }
}
