import 'package:e_commerce/core/class/funcrtions/handlind_data.dart';
import 'package:e_commerce/core/class/stutus_request.dart';
import 'package:e_commerce/core/constants/app_colors.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:e_commerce/data/data_source/remote/address_data/address_data.dart';
import 'package:e_commerce/data/model/address_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class AddressViewController extends GetxController {}

class AddressViewControllerImp extends AddressViewController {
  AddressData addressData = AddressData(Get.find());
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.initial;
  List<AddressModel> addresses = [];

  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await addressData
        .viewData(myServices.sharedPreferences.getString('id')!);
    print('=========================================================$response');
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        addresses = [];
        List<dynamic> data = response['data'];
        data.map((e) => addresses.add(AddressModel.fromJson(e))).toList();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  deleteData(int addressId) async {
    statusRequest = StatusRequest.loading;
    var response = await addressData.deleteData(addressId);
    print('=========================================================$response');
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        Get.snackbar(
          'Success',
          'Address deleted Successfully',
          colorText: AppColors.black,
          snackStyle: SnackStyle.FLOATING,
          backgroundColor:
              const Color.fromARGB(255, 178, 178, 178).withOpacity(0.5),
        );
        getData();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
