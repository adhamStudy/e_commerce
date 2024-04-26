import 'package:e_commerce/core/constants/app_colors.dart';
import 'package:e_commerce/data/model/orders/orders_pending_model.dart';
import 'package:flutter/material.dart';

class OrdersCard extends StatelessWidget {
  const OrdersCard({super.key, required this.model});
  final OrderPendingModel model;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Card(
            color: Color.fromARGB(255, 252, 248, 248),
            elevation: 3,
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'order number : ${model.ordersId}',
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const Divider(),
                  model.ordersType == 0
                      ? const Text('Orders type : delivery')
                      : const Text('Orders type : store'),
                  if (model.ordersType == 0)
                    const Text('Orders type : delivery'),
                  Text('Order Price :${model.ordersPrice} \$'),
                  Text('Delevery Price : ${model.ordersPricedelivery} \$'),
                  const Text('Payment method : Cash on delivery \$'),
                  const Divider(),
                  Row(
                    children: [
                      Text(
                        'Total Price : ${model.ordersTotalprice} \$',
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      MaterialButton(
                        color: AppColors.primaryColor,
                        onPressed: () {},
                        child: const Text(
                          'Details',
                          style: TextStyle(
                              color: AppColors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
