import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/controller/products_details_controller/products_details_controller.dart';
import 'package:e_commerce/data/model/cart_model.dart';
import 'package:e_commerce/link_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCartItem extends GetView<ProductDetailsControllerImp> {
  const CustomCartItem({
    required this.onPressedAdd,
    required this.onPressedRemove,
    super.key,
    required this.model,
  });
  final CartModel model;
  final void Function()? onPressedAdd;
  final void Function()? onPressedRemove;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Card(
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: CachedNetworkImage(
                imageUrl: '${AppLink.imageStatic}/items/${model.itemsImage}',
                height: 80,
                width: 80,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    model.itemsName!,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    model.itemTotalPrice.toString(),
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: onPressedAdd,
                  icon: const Icon(Icons.add),
                ),
                Text(model.countItems.toString()),
                IconButton(
                  onPressed: onPressedRemove,
                  icon: const Icon(Icons.remove),
                ),
              ],
            ),
            SizedBox(
              width: 15,
            ),
          ],
        ),
      ),
    );
  }
}
