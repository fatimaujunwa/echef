

import 'package:get/get_connect/http/src/response/response.dart';

import '../../app_constants/app_variables.dart';
import '../../application_layer/services/api_client.dart';

class FoodRepo{
  final ApiClient apiClient;
  FoodRepo({required this.apiClient});

  Future<Response>getFood()async{
   return await apiClient.getData(AppVariables.FOODDETAILS_URI);
  }

  Future<Response>getBestDeals()async{
    return await apiClient.getData(AppVariables.BESTDEALS_URI);
  }
  Future<Response>getFoodCategories()async{
    return await apiClient.getData(AppVariables.CATEGORIES_URI);
  }
  Future<Response>getFoodTypes(int foodtype_id)async{
    return await apiClient.getData('${AppVariables.FOODTYPE_URI}?foodtype_id=$foodtype_id');
  }




}
