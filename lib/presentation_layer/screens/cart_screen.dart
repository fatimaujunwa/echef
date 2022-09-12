import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ifood/app_constants/dimensions.dart';

import '../../app_constants/app_variables.dart';
import '../../app_constants/reuseable_widgets/app_icon.dart';
import '../../app_constants/reuseable_widgets/profile-page.dart';
import '../../app_constants/route_helper.dart';
import '../controllers/cart_controller.dart';
import '../controllers/food_controller.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<CartController>();

    //Todo you wrap in getx mainly when you want to load that contoller for the first time. when you have already loaded and used in one page all you need to do is save other properties of it to be used in a variable
    return Scaffold(
      backgroundColor: Colors.white,
      endDrawer: MenuScreen(),
      appBar: AppBar(
        titleSpacing: 0.0,
        title: Row(
          children: [
            IconButton(
                onPressed: () {
                  Get.toNamed(RouteHelper.getFoodScreen());
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                  size: 30,
                )),
            SizedBox(
              width: 60,
            )
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black, size: 40),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
              offset: Offset(-0.2, -0.2),
              blurRadius: 50,
              color: Colors.grey.withOpacity(0.2))
        ]),
        padding: EdgeInsets.only(left: 10, right: 10, top: 30),
        height: 250,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: EdgeInsets.only(top: 25),
              child: Row(
                children: [
                  Text('Estimated delivery Time'),
                  Expanded(
                    child: Container(),
                  ),
                  Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.clock,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text('30 mins'),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              children: [
                Text(
                  'Total',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Expanded(
                  child: Container(),
                ),
                RichText(
                  text: TextSpan(
                      text: '\$' + controller.totalPrice.toString(),
                      style: TextStyle(
                          fontSize: 26,
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
                )
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              height: 40,
              width: 100,
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(5)),
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    Future.delayed(Duration.zero,(){
                      //your code goes here
                      Get.toNamed(RouteHelper.getProceedPage());
                    });

                  },
                  child: Container(
                    child: Text(
                      'Proceed',
                      style: TextStyle(
                          color: Dimensions.color,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 23, top: 50),
                  child: Text(
                      controller.getItems.length.toString() + '  item' + '(s)'),
                )
              ],
            ),
            for (int i = 0; i < controller.getItems.length; i++)
              Container(
                margin: EdgeInsets.only(top: 20, left: 12, right: 12),
                height: 120,
                width: 375,
                decoration: BoxDecoration(
                    color: Dimensions.color,
                    borderRadius: BorderRadius.circular(7),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(-1, -1),
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 10)
                    ]),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        var foodIndex = Get.find<FoodController>()
                            .foodList
                            .indexOf((controller.getItems[i].product!));

                        if (foodIndex >= 0) {
                          Get.toNamed(RouteHelper.getOrder(foodIndex));
                        } else if (foodIndex < 0) {
                          Get.snackbar('Order details',
                              'You do not have access to the preview of this product');
                        }
                      },
                      child: Container(
                          padding: EdgeInsets.only(bottom: 30),
                          child: CircleAvatar(
                            radius: 40,
                            backgroundImage: NetworkImage(
                                AppVariables.BASE_URI +
                                    "/uploads/" +
                                    controller.getItems[i].img!),
                          )),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(controller.getItems[i].name!),
                        SizedBox(
                          height: 15,
                        ),


                        GetBuilder<CartController>(builder: (foodController){

                          return Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  controller.addItems(
                                      controller.getItems[i].product!, -1);
                                },
                                child: AppIcon(
                                  iconData: Icons.remove,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                '${controller.getItems[i].quantity}',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              GestureDetector(
                                onTap: () {
                                  controller.addItems(
                                      controller.getItems[i].product!, 1);
                                },
                                child: AppIcon(
                                  iconData: Icons.add,
                                ),
                              ),
                              SizedBox(
                                width: 160,
                              ),
                            ],
                          );

                        }),


                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            RichText(
                              text: TextSpan(
                                  text: '\$' +
                                      controller.getItems[i].price.toString(),
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
                                  children: [
                                    TextSpan(
                                      text: '.13',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black),
                                    )
                                  ]),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              )
          ],
        ),
      ),
    );
    ;
  }
}
