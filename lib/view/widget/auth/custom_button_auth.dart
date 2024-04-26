import 'package:e_commerce/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomButtonAuth extends StatelessWidget {
  const CustomButtonAuth(
      {super.key, required this.text, required this.onPressed});
  final String? text;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      color: AppColors.primaryColor,
      onPressed: onPressed,
      child: Text(
        '$text',
        style: const TextStyle(fontSize: 18, color: AppColors.backgroundColor),
      ),
    );
  }
}
