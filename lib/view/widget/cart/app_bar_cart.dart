import 'package:flutter/material.dart';

class AppBarCart extends StatelessWidget {
  const AppBarCart({super.key, required this.label});
  final String label;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(20),
      child:  Text(
        label,
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}
