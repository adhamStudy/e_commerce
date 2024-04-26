import 'package:e_commerce/core/class/funcrtions/handlind_data.dart';
import 'package:e_commerce/core/class/stutus_request.dart';
import 'package:e_commerce/core/constants/app_colors.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:e_commerce/data/data_source/remote/favorite_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteController extends GetxController {}

class FavoriteControllerImp extends FavoriteController {
  Map isFavorite = {};
  MyServices myServices = Get.find();

  FavoriteData favoriteData = FavoriteData(Get.find());

  late StatusRequest stutusRequest = StatusRequest.initial;
  setFavorite(int id, int value) {
    isFavorite[id] = value;
    update();
  }

  addFavorite(int itemId) async {
    stutusRequest = StatusRequest.loading;
    var response = await favoriteData.addFavorite(
        myServices.sharedPreferences.getString('id')!, itemId.toString());
    print('=========================================================$response');
    stutusRequest = handlingData(response);
    if (StatusRequest.success == stutusRequest) {
      if (response['status'] == 'success') {
        Get.snackbar(
          'Success',
          'Added to favorite',
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

  removeFavorite(int itemId) async {
    stutusRequest = StatusRequest.loading;
    var response = await favoriteData.removeFavorite(
        myServices.sharedPreferences.getString('id')!, itemId.toString());
    print('=========================================================$response');
    stutusRequest = handlingData(response);
    if (StatusRequest.success == stutusRequest) {
      if (response['status'] == 'success') {
        Get.snackbar(
          'Success',
          'Removed from favorites',
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
}
