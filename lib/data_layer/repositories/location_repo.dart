import 'package:get/get_connect/http/src/response/response.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../app_constants/app_variables.dart';
import '../../application_layer/services/api_client.dart';
import 'package:google_maps_webservice/places.dart';

class LocationRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  LocationRepo({required this.apiClient,required this.sharedPreferences});
  //gets address from google using lat and long
  Future<Response>getAddressFromGeocode(LatLng latLng)async{
    return await apiClient.getData('${AppVariables.GEOCODE_URI}'
        '?lat=${latLng.latitude}&lng=${latLng.longitude}', ) ;//calls the data from the api client
  }

  Future <Response> searchLocation(String text)async{
    return await apiClient.getData('${AppVariables.PLACEAUTOCOMPLETE_URI}?search_text=$text');
  }

  Future <Response> setLocation(String placeid)async{
    return await apiClient.getData('${AppVariables.PLACE_DETAILS_URI}?placeid=$placeid');
  }
  Future <Response> saveLocation(String detail)async{
    return await apiClient.postData('', detail);
  }
  void saveLocationToSharedPreferences(String detail){
    sharedPreferences.setString(AppVariables.LOCATION, detail);
  }
  String getLocationFromSharedPreferences(){
    String location='';
    if(sharedPreferences.containsKey(AppVariables.LOCATION)){
     location=sharedPreferences.getString(AppVariables.LOCATION)!;
    }
    else{
      location='';
    }

    return location;
  }
}