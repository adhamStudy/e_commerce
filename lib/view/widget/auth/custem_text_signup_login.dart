import 'package:e_commerce/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextSignupLogin extends StatelessWidget {
   CustomTextSignupLogin({super.key,required this.textOne,required this.textTow,required this.onPressed});
  final String  textOne;
  final String  textTow;
  final void Function()onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
         Text(textOne),
        const SizedBox(
          width: 5,
        ),
        InkWell(
          onTap: () {
            onPressed();
          },
          child:  Text(
            textTow,
            style: const TextStyle(
              color: AppColors.primaryColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
