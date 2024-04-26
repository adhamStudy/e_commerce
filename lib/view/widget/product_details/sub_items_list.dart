
import 'package:e_commerce/controller/products_details_controller/products_details_controller.dart';
import 'package:e_commerce/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubItemsList extends GetView<ProductDetailsControllerImp> {
  const SubItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    return       Row(
                    children: [
                      ...List.generate(
                        controller.subItems.length,
                        (index) => Container(
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          alignment: Alignment.center,
                          width: 70,
                          height: 60,
                          decoration: BoxDecoration(
                            color: controller.subItems[index]['active'] == 1
                                ? AppColors.furtherColor
                                : AppColors.white,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            border: Border.all(color: AppColors.furtherColor),
                          ),
                          child: Text(
                            controller.subItems[index]['name'],
                            style: TextStyle(
                                color: controller.subItems[index]['active'] == 1
                                    ? AppColors.white
                                    : AppColors.furtherColor),
                          ),
                        ),
                      )

                      
                    ],
                  )
           ;
  }
}