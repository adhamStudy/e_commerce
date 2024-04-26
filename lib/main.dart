import 'package:e_commerce/binding/initial_binding.dart';
import 'package:e_commerce/core/localization/change_local.dart';
import 'package:e_commerce/core/localization/translation.dart';
import 'package:e_commerce/core/services/api_services/dio_helper.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:e_commerce/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initailServices();
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LocalController controller = Get.put(LocalController());
    return GetMaterialApp(
   
      initialBinding: InitialBindings(),
      locale: controller.language,
      getPages: routesList,
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: controller.appTheme,
      // home: LanguageView(),
    );
  }
}
