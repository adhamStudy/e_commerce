import 'dart:ui';
import 'package:e_commerce/core/class/funcrtions/fcm_config.dart';
import 'package:e_commerce/core/constants/app_theme.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class LocalController extends GetxController {
  Locale? language;
  MyServices myServices = Get.find();

  changeLanguage(String langcode) async {
    Locale locale = Locale(langcode);
    myServices.sharedPreferences.setString('lang', langcode);
    Get.updateLocale(locale);
  }

  requusetPermissionLocation() async {
    bool? serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Get.snackbar('warning ', 'please activate location in your device');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Get.snackbar('warning ', 'please activate location in your device');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      Get.snackbar(
          'warning ', 'you cannot use the application without location');
    }
  }

  ThemeData appTheme = themeEnglish;

  @override
  void onInit() {
    messagingPermesions();
    fcmConfig();
    requusetPermissionLocation();
    String? lang = myServices.sharedPreferences.getString('lang');
    if (lang == 'ar') {
      language = const Locale('ar');
      appTheme = themeArabic;
    } else if (lang == 'en') {
      language = const Locale('en');
      appTheme = themeEnglish;
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
      appTheme = themeEnglish;
    }
    super.onInit();
  }
}
