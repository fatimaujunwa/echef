import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ifood/app_constants/dimensions.dart';

import '../../app_constants/reuseable_widgets/cut_out_text.dart';
import '../../app_constants/route_helper.dart';
import '../../app_constants/text_styles.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController animationController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = new AnimationController(
        vsync: this, duration: const Duration(seconds: 2))
      ..forward();
    animation =
        new CurvedAnimation(parent: animationController, curve: Curves.easeIn);
    Timer

      (const Duration(seconds: 4), ()=>Get.offNamed(RouteHelper.getLocation()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TextDimension.WhiteColor,
      body: Stack(
        children: [
          Positioned(
              top: Dimensions.h200,
              left: Dimensions.w120,
              right: Dimensions.w120,
              child: ScaleTransition(
                scale: animation,
                child: Container(
                  height: Dimensions.h120,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage('images/eChef logo.png'),
                  )),
                ),
              )),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/foodwall1.jpg'))),
                child: CutOutText()),
          ),
        ],
      ),
    );
  }
}
//
