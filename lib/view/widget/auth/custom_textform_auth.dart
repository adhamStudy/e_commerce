import 'package:e_commerce/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextFormAuth extends StatelessWidget {
  final String hintText;
  final String labelText;
  final IconData icon;
  final String? Function(String?) validator;
  final TextEditingController controller;
  final bool isNumber;
  final bool? absureText;
  final void Function()? onTapIcon;
  const CustomTextFormAuth({
    super.key,
    required this.hintText,
    required this.labelText,
    required this.icon,
    required this.controller,
    required this.validator,
    required this.isNumber,
    this.absureText, this.onTapIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: absureText ?? false,
      keyboardType: isNumber
          ? const TextInputType.numberWithOptions(decimal: true)
          : TextInputType.text,
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: AppColors.grey,
            ),
        suffixIcon: InkWell(onTap:onTapIcon, child: Icon(icon)),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        label: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('$labelText'),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 30),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}
