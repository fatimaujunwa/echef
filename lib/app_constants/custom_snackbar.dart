
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

void showCustomSnackBar(String message,{bool isError=true,String title='Error'}){
  Get.snackbar(
    isError==true?title:'Login Message',
    message,
animationDuration: Duration(seconds: 1),
    duration: Duration(seconds: 2),
    titleText:Text(title),
    messageText: Text(message,),


  );
}