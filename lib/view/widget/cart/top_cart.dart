import 'package:e_commerce/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class TopCart extends StatelessWidget {
  const TopCart({super.key, required this.label});
  final String label;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.primaryColor.withOpacity(0.5),
      ),
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(10),
        child: Text(
          label,
          style: const TextStyle(color: AppColors.black, fontSize: 18),
        ),
      ),
    );
  }
}
