import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ifood/app_constants/dimensions.dart';
import 'package:ifood/app_constants/text_styles.dart';

class UnderlinedTextField extends StatelessWidget {
  const UnderlinedTextField({
    Key? key,
    required this.controller,
    required this.text,
    required this.icon,
    this.color=Colors.black
  }) : super(key: key);

  final TextEditingController controller;
  final String text;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: new ThemeData(
          hintColor: Colors.grey
      ),
      child:
      TextField(
        controller: controller,
        decoration: InputDecoration(

          hintText: text,
          hintStyle: TextDimension.style14Black,

          prefixIcon: Icon(icon,color: color.withOpacity(0.8),size: Dimensions.h20,),
          border: UnderlineInputBorder(
              borderSide: BorderSide(color: color)

          ),

          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: color.withOpacity(0.8),width: 2)

          ),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: color.withOpacity(0.8),width: 2)

          ),
        ),

      ),
    );
  }
}