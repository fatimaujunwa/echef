import 'dart:ffi';

import 'package:flutter/cupertino.dart';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';

import '../../data_layer/repositories/location_repo.dart';
class LocationController extends GetxController{
  final LocationRepo locationRepo;
  String _address='';
  String get address=>_address;
  String _pickAddress='';
  String get pickAddress=>_pickAddress;
  bool pickadd=false;
  List <Prediction> predictionList=[];
  LocationController({required this.locationRepo});
  Future <void>updatePosition(CameraPosition cameraPosition) async {
    if(pickadd){
      _address=await getAddressFromGeocode(LatLng(cameraPosition.target.latitude, cameraPosition.target.longitude));
      update();
      print(_address);
    }
  }

  Future<void>updateAddress(LatLng point)async{
    pickadd=true;
    if(pickadd==true){

      _pickAddress=await getAddressFromGeocode(point);
      update();
    }}

  Future<String>getAddressFromGeocode(LatLng latLng)async{
    String address='';
    Response response=await locationRepo.getAddressFromGeocode(latLng);
    if(response.body["status"]=='OK'){
      address=response.body["results"][0]['formatted_address'].toString();
      print(response.body);
    }
    else{
      print('Error getting to geocode api');
    }
    return address;
  }
  Future<List<Prediction>>searchLocation(BuildContext context,String text)async{
    if(text.isNotEmpty){
      Response response=await locationRepo.searchLocation(text);
      if(response.statusCode==200&&response.body['status']=='OK'){
        predictionList=[];
        print(response.body.toString());
        response.body['predictions'].forEach((predictions)=>predictionList.add(Prediction.fromJson(predictions)));
      }else{
print(response.statusCode);
      }
    }

    return predictionList;
  }
  Future <void>setLocation(String placeId,GoogleMapController mapController,String address) async {
    PlacesDetailsResponse detail;
    Response response=await locationRepo.setLocation(placeId);
    detail=PlacesDetailsResponse.fromJson(response.body);
    if(!mapController.isNull){
      mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(detail.result.geometry!.location.lat,
          detail.result.geometry!.location.lng
      ))));
    }
    update();
  }


}