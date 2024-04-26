import 'package:e_commerce/controller/orders/pending_controller.dart';
import 'package:e_commerce/core/class/handling_data_view.dart';
import 'package:e_commerce/view/widget/orders/orders_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersPending extends StatelessWidget {
  const OrdersPending({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersPendingController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pending'),
      ),
      body: GetBuilder<OrdersPendingController>(
        builder: (controller) {
          return HandlingDataVeiw(
            stutusRequest: controller.statusRequest,
            widget: ListView.builder(
              itemCount: controller.items.length,
              itemBuilder: (context, index) {
                return  OrdersCard(model: controller.items[index],);
              },
            ),
          );
        },
      ),
    );
  }
}
