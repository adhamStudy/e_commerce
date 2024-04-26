import 'package:e_commerce/core/class/funcrtions/handlind_data.dart';
import 'package:e_commerce/core/class/stutus_request.dart';
import 'package:e_commerce/core/constants/app_colors.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:e_commerce/data/data_source/remote/cart_data.dart';
import 'package:e_commerce/data/model/cart_model.dart';
import 'package:e_commerce/data/model/items_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ProductDetailsController extends GetxController {
  addItems(String itemId);
  removeItems(String itemId);
  getItemCount(int itemId);
}

class ProductDetailsControllerImp extends ProductDetailsController {
  int countItems = 0;

  late ItemsModel itemsModel;
  late StatusRequest stutusRequest = StatusRequest.initial;
  CartData cartData = CartData(Get.find());
  MyServices myServices = Get.find();

  List<CartModel> data = [];
  List subItems = [
    {
      'name': 'red',
      'id': 1,
      'active': 1,
    },
    {
      'name': 'blue',
      'id': 2,
      'active': 1,
    },
    {
      'name': 'red',
      'id': 3,
      'active': 0,
    }
  ];

  @override
  addItems(String itemId) async {
    stutusRequest = StatusRequest.loading;
    update();
    var response = await cartData.addCart(
        myServices.sharedPreferences.getString('id')!, itemId.toString());
    print('=========================================================$response');
    stutusRequest = handlingData(response);
    if (StatusRequest.success == stutusRequest) {
      if (response['status'] == 'success') {
        Get.snackbar(
          'Success',
          'Item Added to Cart',
          colorText: AppColors.black,
          snackStyle: SnackStyle.FLOATING,
          backgroundColor: Colors.green.withOpacity(0.5),
        );
      } else {
        stutusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  removeItems(String itemId) async {
    stutusRequest = StatusRequest.loading;
    update();
    var response = await cartData.removeCart(
        myServices.sharedPreferences.getString('id')!, itemId.toString());
    print('=========================================================$response');
    stutusRequest = handlingData(response);
    if (StatusRequest.success == stutusRequest) {
      if (response['status'] == 'success') {
        Get.snackbar(
          'Success',
          'Item Deleted from Cart',
          colorText: AppColors.black,
          snackStyle: SnackStyle.FLOATING,
          backgroundColor: Colors.green.withOpacity(0.5),
        );
      } else {
        stutusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  getItemCount(int itemId) async {
    stutusRequest = StatusRequest.loading;
    var response = await cartData.getCountItem(
        myServices.sharedPreferences.getString('id')!, itemId.toString());
    print('=========================================================$response');
    stutusRequest = handlingData(response);
    if (StatusRequest.success == stutusRequest) {
      if (response['status'] == 'success') {
        int itemCount = 0;
        itemCount = response['data'];

        return itemCount;
      } else {
        stutusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    initialData();
    //
    update();

    super.onInit();
  }

  initialData() async {
    stutusRequest = StatusRequest.loading;
    itemsModel = Get.arguments['itemsModel'];
    countItems = await getItemCount(itemsModel.itemsId!);
    stutusRequest = StatusRequest.success;
    update();
  }

  add() async {
    await addItems(itemsModel.itemsId.toString());
    countItems++;
    update();
  }

  remove() async {
    await removeItems(itemsModel.itemsId.toString());
    countItems--;
    update();
  }
}
