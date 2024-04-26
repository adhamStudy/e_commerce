import 'package:e_commerce/controller/home_controller/home_controller.dart';
import 'package:e_commerce/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CusotmCardHome extends GetView<HomeControllerImp> {
  const CusotmCardHome(
      {super.key, required this.title, required this.subTitle});
  final String title;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 25),
      child: Stack(
        children: [
          Container(
            alignment: Alignment.centerRight,
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(20),
            ),
            height: 150,
            child: ListTile(
              title: Text(
                title,
                style: const TextStyle(fontSize: 20, color: Colors.white),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Text(
                  subTitle,
                  style: const TextStyle(fontSize: 30, color: Colors.white),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: -20,
            
            left: controller.lang == 'ar' ? -20 : null,
            right: controller.lang == 'en' ? -20 : null,
            child: Container(
              height: 120,
              width: 120,
              decoration: const BoxDecoration(
                  color: AppColors.SecondaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
            ),
          )
        ],
      ),
    );
  }
}
