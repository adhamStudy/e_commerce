import 'package:e_commerce/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomBottonLang extends StatelessWidget {
   const CustomBottonLang({super.key, 
   
    required this.textBotton,
    required this.onPressed,
   });
  final String textBotton;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 100),
      width: double.infinity,
      child: MaterialButton(
        color: AppColors.primaryColor,
        onPressed: onPressed,
        child:  Text(
         textBotton,
          style:const  TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
