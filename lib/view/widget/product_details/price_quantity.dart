import 'package:e_commerce/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class PriceQuantity extends StatelessWidget {
  const PriceQuantity(
      {super.key,
      this.onAdd,
      this.onRemove,
      required this.count,
      required this.price});
  final void Function()? onAdd;
  final void Function()? onRemove;
  final String count;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
         Text(
         price,
          style:const TextStyle(fontSize: 20),
        ),
        const Spacer(),
        Row(
          children: [
            IconButton(
              onPressed: onAdd,
              icon: const Icon(Icons.add),
              color: AppColors.primaryColor,
            ),
            Container(
              child:  Text(
                count,
                style:const TextStyle(fontSize: 20),
              ),
            ),
            IconButton(
              onPressed: onRemove,
              icon: const Icon(Icons.remove),
              color: AppColors.primaryColor,
            ),
          ],
        )
      ],
    );
  }
}
