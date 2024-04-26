import 'dart:async';

import 'package:e_commerce/core/class/stutus_request.dart';
import 'package:e_commerce/core/constants/app_routes.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class AddAddressController extends GetxController {}

class AddAddressControllerImp extends AddAddressController {
  late final Completer<GoogleMapController> completerController;
  StatusRequest statusRequest = StatusRequest.initial;
  Position? position;
  CameraPosition? kGooglePlex;

  List<Marker> markers = [];
  double? lat;
  double? long;
  getCurrentLocation() async {
    statusRequest = StatusRequest.loading;
    position = await Geolocator.getCurrentPosition();
    kGooglePlex = CameraPosition(
      target: LatLng(position!.latitude, position!.longitude),
      zoom: 14.4746,
    );
    statusRequest = StatusRequest.success;
    update();
  }

  addMarkers(LatLng latlng) {
    markers.clear();
    markers.add(Marker(markerId: MarkerId('1'), position: latlng));
    lat = latlng.latitude;
    long = latlng.longitude;
    update();
  }

  @override
  void onInit() {
    getCurrentLocation();
  completerController = Completer<GoogleMapController>();
    super.onInit();
  }

  gotoAddressDetails() {
    Get.toNamed(AppRoute.addressAddDetails,
        arguments: {'lat': lat.toString(), 'long': long.toString()});
  }
}
