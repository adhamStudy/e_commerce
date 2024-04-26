import 'package:e_commerce/core/constants/app_routes.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyMiddleWare extends GetMiddleware {
  MyServices myServices = Get.find();

  int? get Priority => 1;
  @override
  RouteSettings? redirect(String? route) {
    if (myServices.sharedPreferences.getString('step') == '2') {
      return const RouteSettings(name: AppRoute.homePage);
    } else if (myServices.sharedPreferences.getString('step') == '1') {
return const RouteSettings(name: AppRoute.login);
    }
    return null; 


  }
}
