import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ifood/app_constants/dimensions.dart';

import '../../app_constants/app_variables.dart';
import '../../app_constants/reuseable_widgets/order_container.dart';
import '../../app_constants/reuseable_widgets/profile-page.dart';
import '../../app_constants/route_helper.dart';
import '../../app_constants/text_styles.dart';
import '../controllers/cart_controller.dart';
import '../controllers/favorites_controller.dart';
import '../controllers/food_controller.dart';

class FoodScreen extends StatefulWidget {
  const FoodScreen({Key? key}) : super(key: key);

  @override
  State<FoodScreen> createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  @override
  Widget build(BuildContext context) {
    Get.find<FoodController>().getFood();

    List<String> images = [
      'images/food.jpg',
      'images/foodfries.jpg',
      'images/foodporridge.jpg',
      'images/foodsoup.jpg',
      'images/breakfast.png'
    ];
    return Scaffold(
      drawer: const MenuScreen(),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black, size: Dimensions.h40),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: Dimensions.h58,
              color: Colors.white,
              child: Stack(
                children: [
                  Positioned(
                    top: Dimensions.h15,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: Dimensions.h45,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(18),
                            topRight: Radius.circular(18),
                          )),
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: Dimensions.w20),
                            child: Row(
                              children: [
                                Text(
                                  '50',
                                  style: TextDimension.style40BWhite,
                                ),
                                Column(
                                  children: [
                                    Text('%', style: TextDimension.style14Bold),
                                    SizedBox(
                                      height: Dimensions.h5,
                                    ),
                                    Text('OFF',
                                        style: TextDimension.style14Bold),
                                  ],
                                ),
                                SizedBox(
                                  width: Dimensions.w75,
                                ),
                                Column(
                                  children: [
                                    Text(''),
                                    SizedBox(
                                      height: Dimensions.h5,
                                    ),
                                    Text('Code: xFs50',
                                        style: TextDimension.style14),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: Dimensions.w10,
                    child: Container(
                      height: Dimensions.h30,
                      width: Dimensions.w270,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                offset: Offset(-1, -8),
                                blurRadius: 10),
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          )),
                      child: Row(
                        children: [
                          Container(
                              padding: EdgeInsets.only(
                                  top: Dimensions.h5, left: Dimensions.w7),
                              child: Text(
                                'ON YOUR FIRST',
                                style: TextDimension.style16Bold,
                              )),
                          SizedBox(
                            width: Dimensions.w3,
                          ),
                          Text('2', style: TextDimension.style30w900),
                          Container(
                              padding:
                                  EdgeInsets.only(top: Dimensions.h5, left: 1),
                              child: Text(
                                'ORDERS',
                                style: TextDimension.style16Bold,
                              )),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin:
                  EdgeInsets.only(left: Dimensions.w10, top: Dimensions.w15),
              child: Text(
                'Best Deals',
                style: TextDimension.style16w500,
              ),
            ),
            GestureDetector(
              onTap: () {

              },
              child: GetBuilder<FoodController>(builder: (bestDeals) {
                return Container(
                  height: Dimensions.h170,
                  // color: Colors.red,
                  child: ListView.builder(
                      itemCount: bestDeals.bestDeals.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Get.toNamed(RouteHelper.getOrder(index));
                          },
                          child: Stack(
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                    left: Dimensions.w10,
                                    right: Dimensions.w10,
                                    top: Dimensions.h20),
                                height: Dimensions.h120,
                                width: Dimensions.w140,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(0, 10),
                                        blurRadius: 9,
                                        color: Colors.grey.withOpacity(0.5)),
                                  ],
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(90),
                                      topLeft: Radius.circular(90)),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          AppVariables.BASE_URI +
                                              "/uploads/" +
                                              bestDeals
                                                  .bestDeals[index].thumbnail!),
                                      fit: BoxFit.cover),
                                ),
                              ),
                              Positioned(
                                top: Dimensions.h100,
                                left: Dimensions.w10,
                                child: Container(
                                  height: Dimensions.h50,
                                  width: Dimensions.w140,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'images/product wave.png'),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: Dimensions.h80,
                                left: Dimensions.w27,
                                child: Container(
                                  height: Dimensions.h100,
                                  width: Dimensions.w140,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'images/Add button.png')),
                                  ),
                                  child: Container(
                                      padding: EdgeInsets.only(
                                          left: Dimensions.w12,
                                          top: Dimensions.w10),
                                      child: Icon(
                                        FontAwesomeIcons.plus,
                                        color: Colors.white,
                                        size: 20,
                                      )),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                );
              }),
            ),
            Container(
              margin:
                  EdgeInsets.only(left: Dimensions.w10, bottom: Dimensions.h13),
              child: Text(
                'Categories',
                style: TextDimension.style16w500,
              ),
            ),
            GetBuilder<FoodController>(builder: (categories) {
              return Container(
                height: 90,
                child: ListView.builder(
                    itemCount: categories.categories.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Get.toNamed(RouteHelper.getItems(index));
                        },
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      offset: Offset(1, 1),
                                      blurRadius: 3,
                                      color: Colors.grey.withOpacity(0.2))
                                ],
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(50),
                                  bottomRight: Radius.circular(50),
                                ),
                                color: TextDimension.BabyPinkColor,
                              ),
                              margin: EdgeInsets.only(
                                  left: Dimensions.w18,
                                  top: Dimensions.h15,
                                  right: Dimensions.w15),
                              height: Dimensions.h50,
                              width: Dimensions.w51,
                              child: Container(
                                  padding: EdgeInsets.only(
                                      left: Dimensions.w45,
                                      top: Dimensions.h18),
                                  child: Text(
                                    categories.categories[index].title!,
                                    style: TextDimension.style12w600,
                                  )),
                            ),
                            Positioned(
                              left: Dimensions.w10,
                              top: Dimensions.h3,
                              child: CircleAvatar(
                                radius: Dimensions.h35,
                                backgroundImage: AssetImage(images[index]),
                              ),
                            )
                          ],
                        ),
                      );
                    }),
              );
            }),
            Container(
              margin:
                  EdgeInsets.only(left: Dimensions.w10, bottom: Dimensions.h15),
              child: Text(
                'what would you be eating today?',
                style: TextDimension.style16w500,
              ),
            ),
            GetBuilder<FoodController>(builder: (foodController) {
              return GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: foodController.foodList.length,
                itemBuilder: (_, index) {
                  return GetBuilder<FavoritesController>(builder: (favorite) {
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(RouteHelper.getOrder(index));
                      },
                      child: Container(
                        height: Dimensions.h177,
                        width: Dimensions.w155,
                        margin: EdgeInsets.only(
                            top: Dimensions.h10,
                            left: Dimensions.w10,
                            right: Dimensions.w10),
                        decoration: BoxDecoration(
                            color: TextDimension.BabyPinkColor,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.6),
                                  offset: Offset(1, 5),
                                  blurRadius: 10),
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.6),
                                  offset: Offset(-4, 0),
                                  blurRadius: 10)
                            ]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(7.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: Dimensions.w140,
                                    child: Text(
                                      foodController.foodList[index].title!
                                          .toString(),
                                      style: TextDimension.style12,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {


                                      favorite.favFood(
                                          foodController.foodList[index]);
                                      print(Get.find<FavoritesController>().favoriteFood);
                                      favorite.addFavoriteItems(
                                          foodController.foodList[index]);
                                      Get.snackbar(
                                          'Message', 'added to favorites!',
                                          colorText: Colors.white);
                                    },
                                    child: Icon(
                                      favorite.favoriteFood![index+1] == true
                                          ? Icons.favorite
                                          : FontAwesomeIcons.heart,
                                      size: Dimensions.h20,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: Dimensions.h7,
                                left: Dimensions.w7,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Delivery Time' + index.toString(),
                                          style: TextDimension.style12),
                                      Text('20 mins',
                                          style: TextDimension.style12)
                                    ],
                                  ),
                                  CircleAvatar(
                                    backgroundColor: Colors.blue,
                                    radius: Dimensions.h40,
                                    backgroundImage: NetworkImage(
                                        AppVariables.BASE_URI +
                                            "/uploads/" +
                                            foodController
                                                .foodList[index].thumbnail!),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(Dimensions.h7),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  OrderContainer(index: index),
                                  Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            bottom: Dimensions.h5),
                                        child: Text(
                                          '\$',
                                          style: TextDimension.style12,
                                        ),
                                      ),
                                      Text(
                                          foodController.foodList[index].price!,
                                          style: TextDimension.style14w500)
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  });
                },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 20),
              );
            })
          ],
        ),
      ),
    );
  }
}
