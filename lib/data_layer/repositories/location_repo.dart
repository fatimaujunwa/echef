import 'package:get/get_connect/http/src/response/response.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../app_constants/app_variables.dart';
import '../../application_layer/services/api_client.dart';

class LocationRepo {
  final ApiClient apiClient;
  LocationRepo({required this.apiClient});
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
}