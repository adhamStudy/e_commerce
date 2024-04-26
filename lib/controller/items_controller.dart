import 'package:e_commerce/core/class/funcrtions/handlind_data.dart';
import 'package:e_commerce/core/class/stutus_request.dart';
import 'package:e_commerce/core/constants/app_routes.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:e_commerce/data/data_source/remote/items/items_data.dart';
import 'package:e_commerce/data/model/items_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ItemsController extends GetxController {
  initialData();
  changeCat(int value);
  getItems(String catId);
  gotoProductsDetails(ItemsModel item);
}

class ItemsControllerImp extends ItemsController {
  late List categories = [];
  late int selectedCat;
  MyServices myServices = Get.find();
  List<ItemsModel> items = [];
  TextEditingController? search;

  ItemsData itemsData = ItemsData(Get.find());

  late StatusRequest stutusRequest = StatusRequest.initial;
  @override
  void onInit() {
    initialData();
    search = TextEditingController();
    getItems(selectedCat.toString());
    super.onInit();
  }

  @override
  initialData() {
    categories = Get.arguments['categories'];
    selectedCat = Get.arguments['selectedCat'];
  }

  @override
  changeCat(int value) {
    selectedCat = value;
    getItems(value.toString());
    update();
  }

  @override
  getItems(String catId) async {
    items = [];
    stutusRequest = StatusRequest.loading;
    var response = await itemsData.getData(
        catId, myServices.sharedPreferences.getString('id')!);
    print('=========================================================$response');
    stutusRequest = handlingData(response);
    if (StatusRequest.success == stutusRequest) {
      if (response['status'] == 'success') {
        response['data'].map((e) => items.add(ItemsModel.fromJson(e))).toList();
      } else {
        stutusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  gotoProductsDetails(item) {
    Get.toNamed(AppRoute.productsDetails, arguments: {'itemsModel': item});
  }

  List<ItemsModel> dataSearch = [];
  searchData() async {
    stutusRequest = StatusRequest.loading;
    var response = await itemsData.searchData(search!.text);
    print('=========================================================$response');
    stutusRequest = handlingData(response);
    if (StatusRequest.success == stutusRequest) {
      if (response['status'] == 'success') {
        dataSearch.clear();
        response['data']
            .map((e) => dataSearch.add(ItemsModel.fromJson(e)))
            .toList();
      } else {
        stutusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  bool isSearch = false;
  checkSearch(value) {
    if (value == '') {
      stutusRequest = StatusRequest.initial;
      isSearch = false;
    }
    update();
  }

  onSearchItems() {
    isSearch = true;
    searchData();

    update();
  }
}
