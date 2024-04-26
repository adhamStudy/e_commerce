import 'package:e_commerce/controller/address_controller/address_view_controller.dart';
import 'package:e_commerce/core/class/handling_data_view.dart';
import 'package:e_commerce/core/constants/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddressViewControllerImp());
    return Scaffold(
        appBar: AppBar(
          title: const Text('Address '),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed(AppRoute.addressAdd);
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        body: GetBuilder<AddressViewControllerImp>(
          builder: (controller) {
            return HandlingDataVeiw(
              stutusRequest: controller.statusRequest,
              widget: Container(
                padding: EdgeInsets.all(15),
                width: Get.width,
                child: ListView.builder(
                  itemCount: controller.addresses.length,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              controller.deleteData(
                                  controller.addresses[index].addressId!);
                              print(controller.addresses[index].addressId!);
                            },
                            icon: Icon(
                              Icons.delete_forever_outlined,
                              color: Colors.red,
                            )),
                        Expanded(
                          child: ListTile(
                            title:
                                Text(controller.addresses[index].addressCity!),
                            subtitle: Text(
                                controller.addresses[index].addressStreet!),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            );
          },
        ));
  }
}
