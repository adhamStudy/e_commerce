import 'package:e_commerce/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomButtonAppBar extends StatelessWidget {
  final void Function()? onPressed;
  final String textbutton;
  final IconData icondata;
  final bool? active;
  const CustomButtonAppBar(
      {Key? key,
      required this.textbutton,
      required this.icondata,
      required this.onPressed,
      required this.active})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Icon(icondata,
            color: active == true
                ? AppColors.primaryColor
                : Color.fromARGB(255, 112, 112, 112)),
        Text(textbutton,
            style: TextStyle(
                color: active == true
                    ? AppColors.primaryColor
                    : Color.fromARGB(255, 112, 112, 112))),
        // Text(textbutton,
        //     style: TextStyle(
        //         color: active == true ? AppColor.primaryColor : AppColor.grey2))
      ]),
    );
  }
}
