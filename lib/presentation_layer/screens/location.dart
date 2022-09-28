import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:ifood/app_constants/dimensions.dart';
import 'package:ifood/app_constants/text_styles.dart';

import '../controllers/location_controller.dart';

class UserLocation extends StatefulWidget {
  const UserLocation({Key? key}) : super(key: key);

  @override
  _UserLocationState createState() => _UserLocationState();
}

class _UserLocationState extends State<UserLocation> {
  late GoogleMapController mapController;
  TextEditingController locationController = TextEditingController();
  final LatLng _center = const LatLng(9.0765, 7.3986);
  CameraPosition _cameraPosition =
      CameraPosition(target: LatLng(45.521563, -122.677433), zoom: 17);
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xffF5F5F5),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 458,
              child: GoogleMap(
                zoomControlsEnabled: false,
                compassEnabled: false,
                onCameraMove: (position) => _cameraPosition = position,
                onCameraIdle: () {
                  Get.find<LocationController>()
                      .updatePosition(_cameraPosition);
                },
                onTap: (LatLng point) {
                  Get.find<LocationController>().updateAddress(point);
                },
                onMapCreated: _onMapCreated,
                initialCameraPosition:
                    CameraPosition(target: _center, zoom: 17),
              ),
            ),
            SizedBox(
              height: 46,
            ),
            Container(
                margin: EdgeInsets.only(left: Dimensions.w37),
                child: Text(
                  'Location',
                  style: TextDimension.style18,
                )),
            SizedBox(
              height: Dimensions.h8,
            ),
            Container(
              margin: EdgeInsets.only(left: Dimensions.w37),
              child: Text(
                'This information will help you better',
                style: TextDimension.style11,
              ),
            ),
            // Container(
            //   margin: EdgeInsets.only(
            //       left: Dimensions.w37,
            //       right: Dimensions.w37,
            //       top: Dimensions.h46),
            //   child: Theme(
            //       data: ThemeData(hintColor: Colors.grey),
            //       child: GetBuilder<LocationController>(
            //           builder: (locationAddress) {
            //         locationController.text = '${locationAddress.pickAddress}';
            //         return TypeAheadField(
            //             textFieldConfiguration: TextFieldConfiguration(
            //                 controller: locationController,
            //                 textInputAction: TextInputAction.search,
            //                 autofocus: true,
            //                 textCapitalization: TextCapitalization.words,
            //                 keyboardType: TextInputType.streetAddress,
            //                 decoration: InputDecoration(
            //                   hintText: 'where are you?',
            //                   hintStyle: TextDimension.style14grey,
            //                   border: UnderlineInputBorder(
            //                       borderSide: BorderSide(
            //                           color: Colors.black.withOpacity(0.8))),
            //                   focusedBorder: UnderlineInputBorder(
            //                       borderSide: BorderSide(
            //                           color: Colors.black.withOpacity(0.8),
            //                           width: 2)),
            //                   enabledBorder: UnderlineInputBorder(
            //                       borderSide: BorderSide(
            //                           color: Colors.black.withOpacity(0.8),
            //                           width: 2)),
            //                 )),
            //             suggestionsCallback: (String pattern) {
            //               return Get.find<LocationController>()
            //                   .searchLocation(context, pattern);
            //             },
            //             itemBuilder: (context, Prediction? suggestion) {
            //               return Padding(
            //                 padding: const EdgeInsets.all(8.0),
            //                 child: Row(
            //                   children: [
            //                     Icon(Icons.location_on),
            //                     Expanded(
            //                         child: Text(suggestion?.description ?? ""))
            //                   ],
            //                 ),
            //               );
            //             },
            //             onSuggestionSelected: (Prediction suggestion) {
            //               Get.find<LocationController>().setLocation(
            //                   suggestion.placeId!,
            //                   mapController,
            //                   suggestion.description!);
            //               Get.back();
            //             });
            //
            //         //   TextFormField(
            //         //   enableSuggestions: true,
            //         //
            //         //   controller: locationController,
            //         //
            //         //   decoration: InputDecoration(
            //         //
            //         //     hintText: 'Where are you?',
            //         //
            //         //     border: UnderlineInputBorder(
            //         //         borderSide: BorderSide(color: Colors.black.withOpacity(0.8))
            //         //
            //         //     ),
            //         //
            //         //     focusedBorder: UnderlineInputBorder(
            //         //         borderSide: BorderSide(color: Colors.black.withOpacity(0.8),width: 2)
            //         //
            //         //     ),
            //         //     enabledBorder: UnderlineInputBorder(
            //         //         borderSide: BorderSide(color: Colors.black.withOpacity(0.8),width: 2)
            //         //
            //         //     ),
            //         //   ),
            //         //
            //         // );
            //       })),
            // ),
          ],
        ),
      ),
    );
  }
}
