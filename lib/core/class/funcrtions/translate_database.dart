import 'package:e_commerce/core/services/services.dart';
import 'package:get/get.dart';

translateDataBase(column_ar, column_en) {
  MyServices myServices = Get.find();
  if (myServices.sharedPreferences.getString('lang') == 'ar') {
    return column_ar;
  } else {
    return column_en;
  }
}
