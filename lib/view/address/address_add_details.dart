import 'package:e_commerce/controller/address_controller/address_details_controller.dart';
import 'package:e_commerce/view/widget/auth/custom_button_auth.dart';
import 'package:e_commerce/view/widget/auth/custom_textform_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressAddDetails extends StatelessWidget {
  const AddressAddDetails({super.key});

  @override
  Widget build(BuildContext context) {
    AddAddressDetailsControllerImp controller =
        Get.put(AddAddressDetailsControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Address Details'),
      ),
      body: ListView(padding: const EdgeInsets.all(20), children: [
        CustomTextFormAuth(
            hintText: 'City',
            labelText: 'city',
            icon: Icons.location_city,
            controller: controller.city!,
            validator: (p0) {
              return null;
            },
            isNumber: false),
        const SizedBox(
          height: 30,
        ),
        CustomTextFormAuth(
            hintText: 'Street',
            labelText: 'Street',
            icon: Icons.streetview,
            controller: controller.street!,
            validator: (p0) {
              return null;
            },
            isNumber: false),
        const SizedBox(
          height: 30,
        ),
        CustomTextFormAuth(
            hintText: 'name',
            labelText: 'name',
            icon: Icons.location_history_sharp,
            controller: controller.name!,
            validator: (p0) {
              if (p0 == null) {
                return 'error ';
              } else
                return null;
            },
            isNumber: false),
        const SizedBox(
          height: 30,
        ),
        CustomButtonAuth(
          text: 'Add Location',
          onPressed: () {
            controller.addLocation();
          },
        )
      ]),
    );
  }
}
