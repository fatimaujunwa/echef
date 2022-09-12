import 'package:flutter/material.dart';

import 'package:ifood/app_constants/size_config.dart';

import 'dimensions.dart';



class TextDimension{
  static const WhiteColor=Color(0xffF5F5F5);

  static const BlackColor=Color(0xff1C1C22);
  static const BabyPinkColor=Color(0xffFFFAFA);
  static const GreyDarkColor=Color(0xff787878);
  static const Grey=Color(0xff787878);
  static const MiddleGrey=Color(0xffC4C4C4);
  static const RedColor=Color(0xffA42126);
  static const Gold=Color(0xffFE990D);
  static const GreyLighter=Color(0xffEBEBEB);



  static final style19=TextStyle(
    fontSize: 2.12*SizeConfig.textMultiplier,
    fontWeight: FontWeight.w600,
  );
  static final style16=  TextStyle(
    fontSize: 1.7857*SizeConfig.textMultiplier,fontWeight: FontWeight.w500,

  );

  static final style18=  TextStyle(
    fontSize: 2.00*SizeConfig.textMultiplier,fontWeight: FontWeight.w500,

  );
  static final style11=  TextStyle(
    fontSize: 1.227*SizeConfig.textMultiplier,fontWeight: FontWeight.w500,
color: Colors.grey
  );
  static final style12=TextStyle(color: Colors.grey,
    fontSize: 1.339*SizeConfig.textMultiplier,fontWeight: FontWeight.w500,

  );
  static final style14=TextStyle(
      fontSize: 1.5625*SizeConfig.textMultiplier,
color: Colors.white
  );
  static final style14grey=TextStyle(
      fontSize: 1.5625*SizeConfig.textMultiplier,
      color: Colors.grey
  );
  static final style14Black=TextStyle(
      fontSize: 1.5625*SizeConfig.textMultiplier,
      color: Colors.black
  );

  static final style14Bold=TextStyle(
      fontSize: 1.5625*SizeConfig.textMultiplier,
      color: Colors.white,
    fontWeight: FontWeight.bold
  );
  static final style40BWhite=TextStyle(
      color: Colors.white,
      fontSize: 4.46*SizeConfig.textMultiplier,
      fontWeight: FontWeight.bold);
  static final style16Bold= TextStyle(
  fontWeight: FontWeight.bold, fontSize: 1.7857*SizeConfig.textMultiplier);

  static final style30w900 =TextStyle(
  fontWeight: FontWeight.w900, fontSize: 3.3482*SizeConfig.textMultiplier);
  static final style14w500=TextStyle(fontSize: 1.5625*SizeConfig.textMultiplier, fontWeight: FontWeight.w500);
  static final style16w500=TextStyle(fontSize: 1.7857*SizeConfig.textMultiplier, fontWeight: FontWeight.w500);
  static final style12w600=TextStyle(fontSize: 1.339*SizeConfig.textMultiplier, fontWeight: FontWeight.w600);
  static final style16w400= TextStyle(
  color: BabyPinkColor,
  fontSize: 1.7857*SizeConfig.textMultiplier,
  fontWeight: FontWeight.w400);

}