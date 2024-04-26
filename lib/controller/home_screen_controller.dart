import 'package:e_commerce/view/screen/home/home_page.dart';
import 'package:e_commerce/view/screen/home/settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int currentPage);
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentIndex = 0;
  List bottomAppBar = [
    {'label': 'Home', 'icon': Icons.home},
    {'label': 'categories', 'icon': Icons.category_outlined},
    {'label': 'profile', 'icon': Icons.person},
    {'label': 'settings', 'icon': Icons.settings},
  ];
  List<Widget> listPage = [
    const HomePage(),
    Container(
      child: const Text(
        'Card',
        style: TextStyle(fontSize: 32),
      ),
    ),
    Container(
      child: const Text(
        'Favorates',
        style: TextStyle(fontSize: 32),
      ),
    ),
    const SettignsView(),
  ];
  @override
  changePage(int currentPage) {
    currentIndex = currentPage;
    update();
  }

  

}
