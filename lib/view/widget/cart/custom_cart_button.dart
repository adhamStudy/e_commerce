import 'package:e_commerce/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CusotmButtonCart extends StatelessWidget {
  const CusotmButtonCart({super.key, required this.label,required this.onPressed});
  final String label ;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: MaterialButton(
            color: AppColors.primaryColor,
            onPressed: onPressed,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Text(
           label,
                style: const TextStyle(fontSize: 18, color: AppColors.white),
              ),
            ),
          ),
          );
  }
}