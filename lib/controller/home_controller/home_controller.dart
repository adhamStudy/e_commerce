import 'package:e_commerce/core/class/funcrtions/handlind_data.dart';
import 'package:e_commerce/core/class/stutus_request.dart';
import 'package:e_commerce/core/constants/app_routes.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:e_commerce/data/data_source/remote/home_data.dart';
import 'package:e_commerce/data/model/categories_model.dart';
import 'package:e_commerce/data/model/items_model.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeController extends GetxController {
  initialData();
  getData();
  gotoItems(List categories, int selectedCat);
  gotoProductsDetails(ItemsModel model);
}

class HomeControllerImp extends HomeController {
  MyServices myServices = Get.find();
  // String username;
  TextEditingController? search;
  String? lang;
  @override
  initialData() {
    lang = myServices.sharedPreferences.getString('lang');
  }

  @override
  void onInit() {
   
    search = TextEditingController();
    initialData();
    getData();
    super.onInit();
  }

  HomeData homeData = HomeData(Get.find());

  List<CategoriesModel> categories = [];
  List<ItemsModel> items = [];
  double? newPrice;
  late StatusRequest stutusRequest = StatusRequest.initial;
  getData() async {
    stutusRequest = StatusRequest.loading;
    var response = await homeData.getData();
    print('=========================================================$response');
    stutusRequest = handlingData(response);
    if (StatusRequest.success == stutusRequest) {
      if (response['status'] == 'success') {
        response['categories']['data']
            .map((e) => categories.add(CategoriesModel.fromJson(e)))
            .toList();
        response['items']['data']
            .map((e) => items.add(ItemsModel.fromJson(e)))
            .toList();
      } else {
        stutusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  gotoItems(categories, selectedCat) {
    Get.toNamed(AppRoute.items,
        arguments: {'categories': categories, 'selectedCat': selectedCat});
  }

  List<ItemsModel> dataSearch = [];
  searchData() async {
    stutusRequest = StatusRequest.loading;
    var response = await homeData.searchData(search!.text);
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

  @override
  gotoProductsDetails(model) {
    Get.toNamed(AppRoute.productsDetails, arguments: {'itemsModel': model});
  }
}
