import 'dart:async';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../core/class/statusrequest.dart';
import '../../core/constant/routes.dart';

class AddAddressController extends GetxController {
  StatusRequest statusRequest = StatusRequest.loading;
  Completer<GoogleMapController>? completerMapController;
  Position? position;
  CameraPosition? kGooglePlex;
  List<Marker> markers = [];
  double? lat;
  double? long;

  addMarker(LatLng latLng) {
    markers.clear();
    markers.add(Marker(markerId: const MarkerId('1'), position: latLng));
    lat = latLng.latitude;
    long = latLng.longitude;
    update();
  }

  gotoAddDetailsScreen() {
    Get.toNamed(AppRoute.addAddressDetails, arguments: {
      "lat": lat.toString(),
      "long": long.toString(),
    });
  }

  getCurrentLocation() async {
    position = await Geolocator.getCurrentPosition();
    kGooglePlex = CameraPosition(
      target: LatLng(position!.latitude, position!.longitude),
      zoom: 14.4746,
    );
    statusRequest = StatusRequest.none;
    update();
  }

  requiestLocationPermision() async {
    bool? serviceEnabled;
    LocationPermission? permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Get.snackbar('WAIRNING', 'Activate LOCATION to continue');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Get.snackbar('WAIRNING', 'The APP need LOCATION to work');
        //permission = await Geolocator.requestPermission();
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Get.snackbar(
          'WAIRNING', 'You can\'t use The APP without LOCATION services');
    }
  }

  @override
  void onInit() {
    requiestLocationPermision();
    getCurrentLocation();
    completerMapController = Completer<GoogleMapController>();
    super.onInit();
  }
}
