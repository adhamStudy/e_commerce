

import 'package:e_commerce/controller/address_controller/address_controller.dart';
import 'package:e_commerce/core/class/handling_data_view.dart';
import 'package:e_commerce/view/widget/auth/custom_button_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddressAdd extends StatelessWidget {
  const AddressAdd({super.key});

  @override
  Widget build(BuildContext context) {
    AddAddressControllerImp pageController = Get.put(AddAddressControllerImp());
    return Scaffold(
        appBar: AppBar(
          title: Text('Address add'),
        ),
        body: GetBuilder<AddAddressControllerImp>(
          builder: (controller) {
            return HandlingDataVeiw(
              stutusRequest: pageController.statusRequest,
              widget: Column(
                children: [
                  if (pageController.kGooglePlex != null)
                    Expanded(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          GoogleMap(
                            onTap: (argument) {
                              pageController.addMarkers(argument);
                            },
                            markers: pageController.markers.toSet(),
                            mapType: MapType.normal,
                            initialCameraPosition: pageController.kGooglePlex!,
                            onMapCreated: (GoogleMapController mapController) {
                              pageController.completerController;
                            },
                          ),
                          Positioned(
                            bottom: 10,
                            child: Container(
                              width: 250,
                              child: CustomButtonAuth(
                                text: 'Complete ',
                                onPressed: () {
                                  pageController.gotoAddressDetails();
                                },
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                ],
              ),
            );
          },
        ));
  }
}
