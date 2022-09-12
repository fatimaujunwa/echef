





import 'package:get/get_connect/connect.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';

class ApiClient extends GetConnect implements GetxService{
  late String token;
  final String appBaseUrl;
  late Map<String,String> _mainHeaders;
  ApiClient({required this.appBaseUrl}){
    baseUrl =appBaseUrl;
    timeout =Duration(seconds: 30);
    token='';
    _mainHeaders={
      'Content-type':'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    };
  }

  void updateHeaders(String token){
    _mainHeaders={
      'Content-type':'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    };
  }

  Future<Response>getData(String uri,)async{
    try{
      Response response= await get(uri);
      print(response.body);
      //calls data from server and saves it in variable response
      return response;
    }catch(e){
      return Response(statusCode: 1,statusText: e.toString());
    }
  }

  Future<Response>postData(String uri,dynamic body)async{
    try{
      Response response= await  post(uri, body,headers: _mainHeaders);

      return response;
    }catch(e){

      return Response(statusCode: 1,statusText: e.toString());
    }

  }


  Future<Response>postLoginData(String uri,dynamic body)async{
    try{
      Response response= await  post(uri, body,headers: _mainHeaders);

      return response;
    }catch(e){

      return Response(statusCode: 1,statusText: e.toString());
    }

  }

}