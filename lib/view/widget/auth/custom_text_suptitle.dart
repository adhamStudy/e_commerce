import 'package:flutter/material.dart';

class CustomTextSuptitle extends StatelessWidget {
  final String title;
  const CustomTextSuptitle({super.key,required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
     title,
      textAlign: TextAlign.center,
      style: Theme.of(context)
          .textTheme
          .headlineLarge!
          .copyWith(fontSize: 16, wordSpacing: 2, height: 1.5),
    );
  }
}
