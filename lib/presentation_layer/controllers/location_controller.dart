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
  String _predictionAddress='';
  String get predictionAddress=>_predictionAddress;
  String get pickAddress=>_pickAddress;
  bool pickadd=false;
  List <Prediction> predictionList=[];
  LocationController({required this.locationRepo});
  //takes the latlng from the camera position when idle. the ncam position changes dynamically because
  //when you move camera the position is saved to _cameraposition variable
  Future <void>updatePosition(CameraPosition cameraPosition) async {
    if(pickadd){
      _address=await getAddressFromGeocode(LatLng(cameraPosition.target.latitude, cameraPosition.target.longitude));
      update();
      print(_address);
    }
  }
// you want to take that point latlng and update address
  Future<void>updateAddress(LatLng point)async{
    pickadd=true;
    if(pickadd==true){

      _pickAddress=await getAddressFromGeocode(point);
      update();
    }}

  Future<String>getAddressFromGeocode(LatLng latLng)async{
    String address='';
    Response response=await locationRepo.getAddressFromGeocode(latLng);
    //saves the address gotten to the address string variable
    if(response.body["status"]=='OK'){
      address=response.body["results"][0]['formatted_address'].toString();//converts the address to string
      print(response.body);
    }
    else{
      print('Error getting to geocode api');
    }
    //returns the address
    return address;
  }
  //returns a prediction object from a text and add it to a list of prediction
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
  //this takes the place id of the prediction selected and returns details
  //within the detals is the lat and lng which can used to show in the camera
  Future <void>setLocation(String placeId,GoogleMapController mapController,String address) async {
    PlacesDetailsResponse detail;
    Response response=await locationRepo.setLocation(placeId);
    detail=PlacesDetailsResponse.fromJson(response.body);
   _predictionAddress=detail.result.formattedAddress!;
   locationRepo.saveLocationToSharedPreferences(_predictionAddress);
   // saveLocation(detail.result.formattedAddress!);
    print('res'+detail.result.toString());
    if(!mapController.isNull){
      mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(detail.result.geometry!.location.lat,
          detail.result.geometry!.location.lng
      ))));
    }
    update();
  }
Future<void>saveLocation( String detail)async{
    Response response= await  locationRepo.saveLocation(detail);
    print(response.body);
    if(response.statusCode==200){
      print('added to database');
    }
    else{
      print('was not addedd to database');
    }
}
String getLocationFromSharedPreferences(){
   return locationRepo.getLocationFromSharedPreferences();
}
}