import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../controller/address/addaddress_controller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../widget/address/continue_btn.dart';

class AddressAdd extends StatelessWidget {
  const AddressAdd({super.key});

  @override
  Widget build(BuildContext context) {
 Get.put(AddAddressController());
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add New Address',
        ),
      ),
      body: SizedBox(
        child: GetBuilder<AddAddressController>(
          builder: (addAddressController) => HandlingDataView(
              statusRequest: addAddressController.statusRequest,
              widget: Column(
                children: [
                  if (addAddressController.kGooglePlex != null)
                    Expanded(
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          GoogleMap(
                            mapType: MapType.normal,
                            markers: addAddressController.markers.toSet(),
                            onTap: (latLng) {
                              addAddressController.addMarker(latLng);
                            },
                            initialCameraPosition:
                                addAddressController.kGooglePlex!,
                            onMapCreated: (GoogleMapController controller) {
                              addAddressController.completerMapController!
                                  .complete(controller);
                            },
                          ),
                          ContinueBtn(
                            title: 'Save and Continue',
                            onPressed: () {
                              addAddressController.gotoAddDetailsScreen();
                            },
                          ),
                        ],
                      ),
                    ),
                ],
              )),
        ),
      ), /*      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: const Text('To the lake!'),
        icon: const Icon(Icons.directions_boat),
      ),*/
    );
  }
}
