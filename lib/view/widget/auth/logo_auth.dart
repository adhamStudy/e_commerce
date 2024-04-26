import 'package:e_commerce/core/constants/image_asset.dart';
import 'package:flutter/material.dart';

class LogoAuth extends StatelessWidget {
  const LogoAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      ImageAsset.logoAuth,
      height: 120,
    );
  }
}
