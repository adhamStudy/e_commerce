import 'package:e_commerce/core/constants/app_routes.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

abstract class SettingsController extends GetxController {
  logOut();
}

class SettingsControllerImpl extends SettingsController {
  @override
  logOut() {
    MyServices myServices = Get.find();
    String? userId = myServices.sharedPreferences.getString('id');
    FirebaseMessaging.instance.unsubscribeFromTopic('users');
    FirebaseMessaging.instance.unsubscribeFromTopic('users$userId');
    myServices.sharedPreferences.clear();
    Get.offAllNamed(AppRoute.login);
  }
}
