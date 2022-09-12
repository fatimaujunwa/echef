import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ifood/app_constants/reuseable_widgets/profile-page.dart';
import 'package:ifood/app_constants/text_styles.dart';

import '../dimensions.dart';
import '../route_helper.dart';

class OrderContainer extends StatelessWidget {
   OrderContainer({
    Key? key,
    required this.index,
    this.order='Place order',
    this.height=32,
    this.width=100
  }) : super(key: key);

  final int index;
  final String order;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return
      Container(
      height: Dimensions.h32,
      width: Dimensions.w51,
      decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(5)),
      child: Center(
        child: Text(
          order,
          style: TextDimension.style16w400,
        ),
      ),
    );
  }
}