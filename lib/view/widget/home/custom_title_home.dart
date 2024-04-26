

import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: Text(
        title,
        style:const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}
