import 'package:e_commerce/controller/home_screen_controller.dart';
import 'package:e_commerce/view/widget/home/bottom_app_bar/custom_nav_bar_element.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomAppBarHome extends StatelessWidget {
  const CustomBottomAppBarHome({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenControllerImp>(
        builder: (controller) => BottomAppBar(
            shape: const CircularNotchedRectangle(),
            notchMargin: 10,
            child: Row(
              children: [
              ...List.generate(controller.listPage.length + 1, ((index) {
                  int i = index > 2 ? index - 1 : index;
                  return index == 2
                      ? const Spacer()
                      : CustomButtonAppBar(
                          textbutton: controller.bottomAppBar[i]['label'],
                          icondata: controller.bottomAppBar[i]['icon'],
                          onPressed: () {
                            controller.changePage(i);
                          },
                          active: controller.currentIndex == i ? true : false);
                }))
              ],
            )));
  }
}