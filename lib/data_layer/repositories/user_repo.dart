
import 'package:get/get.dart';

import '../../app_constants/app_variables.dart';
import '../../application_layer/services/api_client.dart';
import '../../domain_layer/models/sign_in_model.dart';

class UserRepo{
  final ApiClient apiClient;
  UserRepo({required this.apiClient});

  Future<Response>register(Map<String,dynamic>data)async{
    return await apiClient.postData(AppVariables.REGISTER_URI, data);
  }
  Future<Response>login(Map<String,dynamic>data)async{
    return await apiClient.postData(AppVariables.LOGIN_URI, data);
  }

  Future<Response>test(Map<String,dynamic>data)async{
    return await apiClient.postData(AppVariables.TEST_URI,data);
  }

}