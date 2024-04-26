
import 'package:e_commerce/core/class/crud.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(Crud());


  }
}
