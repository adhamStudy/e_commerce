import 'dart:io';

import 'package:firebase_core/firebase_core.dart';

import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyServices extends GetxService {
  late SharedPreferences sharedPreferences;
  Future<MyServices> init() async {
    Platform.isAndroid
        ? await Firebase.initializeApp(
            options: const FirebaseOptions(
                apiKey: 'AIzaSyBSsDWbGtkd3FIdiSrTfwFliM-VFtN7YdM',
                appId: '1:37057138195:android:199d42c189b2b4732439e6',
                messagingSenderId: '37057138195',
                projectId: 'ecommerce-fd2e2'))
        : await Firebase.initializeApp();

    sharedPreferences = await SharedPreferences.getInstance();
 await Permission.notification.request();

    return this;
  }
}

//
initailServices() async {
  await Get.putAsync(() => MyServices().init());
}
