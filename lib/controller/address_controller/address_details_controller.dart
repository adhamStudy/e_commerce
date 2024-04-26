import 'dart:async';

import 'package:e_commerce/core/class/funcrtions/handlind_data.dart';
import 'package:e_commerce/core/class/stutus_request.dart';
import 'package:e_commerce/core/constants/app_colors.dart';
import 'package:e_commerce/core/constants/app_routes.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:e_commerce/data/data_source/remote/address_data/address_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class AddAddressDetailsController extends GetxController {}

class AddAddressDetailsControllerImp extends AddAddressDetailsController {
  late final Completer<GoogleMapController> completerController;
  StatusRequest statusRequest = StatusRequest.initial;
  String? lat;
  String? long;
  AddressData addressData = AddressData(Get.find());
  MyServices myServices = Get.find();
  TextEditingController? name;
  TextEditingController? city;
  TextEditingController? street;

  initialData() {
    lat = Get.arguments['lat'];
    long = Get.arguments['long'];
    print('$lat,,,,,,,,,,,, $long');

    name = TextEditingController();
    city = TextEditingController();
    street = TextEditingController();
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  addLocation() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await addressData.addData(
        city: city!.text,
        lat: lat.toString(),
        long: long.toString(),
        name: name!.text,
        street: street!.text,
        userId: myServices.sharedPreferences.getString('id')!);
    print('=========================================================$response');
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        Get.snackbar(
          'Success',
          'Address Added Successfully',
          colorText: AppColors.black,
          snackStyle: SnackStyle.FLOATING,
          backgroundColor:
              const Color.fromARGB(255, 178, 178, 178).withOpacity(0.5),
        );
        gotoHome();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  gotoHome() {
    Get.offAllNamed(AppRoute.homePage);
  }
}
