import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../app_constants/app_variables.dart';
import '../../app_constants/reuseable_widgets/app_icon.dart';
import '../../app_constants/route_helper.dart';
import '../controllers/cart_controller.dart';
import '../controllers/food_controller.dart';

class FoodDetailScreen extends StatefulWidget {
  final int pageId;

  FoodDetailScreen({Key? key, required this.pageId

      // required this.pageId,
      })
      : super(key: key);

  @override
  _FoodDetailScreenState createState() => _FoodDetailScreenState();
}

class _FoodDetailScreenState extends State<FoodDetailScreen> {
  @override
  void initState() {
    // TODO: implement initState
    //TODO when you move from one screen to another, you have to make sure that the widgets on different pages
    //TODO ARE WRAPPED WITH SAME CONTROLLER ELSE IT WILL FLAG AS SET
    super.initState();

    // WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
    //
    // });
  }

  @override
  Widget build(BuildContext context) {
    var Foodproduct = Get.find<FoodController>().foodList[widget
        .pageId]; // when you initialize and store in a variable and not use get builder to access the method of v aroiable, it only affects the place you use the variable but
    // //when you initialize it like the one bellow and wrap with builder then every other widget wrapped like that has same method and behaves same way
    Get.find<FoodController>()
        .initProduct(Foodproduct, Get.find<CartController>());

    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 400,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(AppVariables.BASE_URI +
                                "/uploads/" +
                                Foodproduct.thumbnail!),
                            fit: BoxFit.cover),
                      ),
                    ),
                    Positioned(
                        top: 300,
                        left: 0,
                        right: 0,
                        child: Container(
                          height: 100,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('images/detailimg.png'),
                                fit: BoxFit.cover),
                          ),
                        )),
                    Positioned(
                        top: 330,
                        left: 20,
                        child: GestureDetector(
                            onTap: () {
                              Get.toNamed(RouteHelper.getFoodScreen());
                            },
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: Colors.black,
                              size: 20,
                            )))
                  ],
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          Foodproduct.title!,
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            RichText(
                              text: TextSpan(
                                  text: '\$' + Foodproduct.price!,
                                  style: TextStyle(
                                      fontSize: 36,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                  children: [
                                    TextSpan(
                                      text: '.13',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    )
                                  ]),
                            ),
                            Expanded(child: Container()),
                            GetBuilder<FoodController>(
                                builder: (foodController) {
                              return Container(
                                child: Row(
                                  children: [
                                    GestureDetector(
                                        onTap: () {
                                          foodController.setQuantity(false);
                                        },
                                        child: AppIcon(
                                          iconData: Icons.remove,
                                        )),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      foodController.inCartItems.toString(),
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.grey),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    GestureDetector(
                                        onTap: () {
                                          foodController.setQuantity(true);
                                        },
                                        child: AppIcon(
                                          iconData: Icons.add,
                                        ))
                                  ],
                                ),
                              );
                            })
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.timer,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              'Delivery Time\n20 mins',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10, right: 10),
                          padding:
                              EdgeInsets.only(left: 30, right: 10, top: 10),
                          height: 140,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xffFFFAFA),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Receipe',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  Expanded(child: Container()),
                                  Icon(FontAwesomeIcons.heart),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                  padding: EdgeInsets.only(left: 25, right: 10),
                                  child: Text(Foodproduct.description!)),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        GetBuilder<FoodController>(builder: (food) {
                          return GestureDetector(
                            onTap: () {
                              food.addItem(Foodproduct);
                            },
                            child: Container(
                              margin: EdgeInsets.only(left: 130, right: 130),
                              height: 45,
                              width: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.black,
                              ),
                              child: Center(
                                  child: Text(
                                'Order',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              )),
                            ),
                          );
                        })
                      ],
                    ),
                  ),
                )
              ],
            ),
            GetBuilder<FoodController>(builder: (controller) {
              return Positioned(
                  right: 0,
                  bottom: 50,
                  child: GestureDetector(
                      child: Container(
                    height: 110,
                    width: 120,
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(55),
                          bottomLeft: Radius.circular(55),
                        )),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(RouteHelper.orderToCart);
                          },
                          child: Container(
                            padding: EdgeInsets.only(
                              top: 20,
                              left: 30,
                            ),
                            child: Container(
                              child: Text(
                                'Cart' +
                                    '(${Get.find<FoodController>().totalItems(Get.find<CartController>())})',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(top: 20, left: 30),
                            height: 40,
                            width: 90,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(55),
                                bottomLeft: Radius.circular(55),
                              ),
                            ),
                            child: Center(
                              child: RichText(
                                text: TextSpan(
                                    text: '\$',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black),
                                    children: [
                                      TextSpan(
                                        text:
                                            '${Get.find<FoodController>().totalPrice(Get.find<CartController>())}' +
                                                '.00',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black),
                                      )
                                    ]),
                              ),
                            ))
                      ],
                    ),
                  )));
            })
          ],
        ));
  }
}
