import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../app_constants/app_variables.dart';
import '../../app_constants/dimensions.dart';
import '../../app_constants/reuseable_widgets/profile-page.dart';
import '../../app_constants/route_helper.dart';
import '../../app_constants/text_styles.dart';
import '../controllers/food_controller.dart';

class FoodCategoryItems extends StatefulWidget {
  final int itemsId;
  const FoodCategoryItems({Key? key, required this.itemsId}) : super(key: key);

  @override
  State<FoodCategoryItems> createState() => _FoodCategoryItemsState();
}

class _FoodCategoryItemsState extends State<FoodCategoryItems> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    Get.find<FoodController>().getFoodType(widget.itemsId + 1);
    var x = Get.find<FoodController>();
    var foodCategory = Get.find<FoodController>().categories[widget.itemsId];
    print(widget.itemsId);
    return Scaffold(
        backgroundColor: TextDimension.WhiteColor,
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
                width: 100,
              ),
              Text(
                foodCategory.title.toString(),
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 16),
              )
            ],
          ),
          backgroundColor: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black, size: 40),
        ),
        body: SingleChildScrollView(
          child: GetBuilder<FoodController>(builder: (controller) {
            return Padding(
              padding: const EdgeInsets.only(top: 15),
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: controller.foodTypeList.length,
                itemBuilder: (_, index) {
                  return GestureDetector(
                    onTap: () {
                      Get.find<FoodController>().foodList.forEach((element) {
                        var foodListJson = jsonEncode(element);
                        var foodTypeListJson = jsonEncode(
                            Get.find<FoodController>().foodTypeList[index]);
                        if (foodListJson == foodTypeListJson) {
                          var foodIndex = Get.find<FoodController>()
                              .foodList
                              .indexOf(element);

                          if (foodIndex >= 0) {
                            Get.toNamed(RouteHelper.getOrder(foodIndex));
                          } else if (foodIndex < 0) {
                            Get.snackbar('Order details',
                                'You do not have access to the preview of this product');
                          }
                        }
                      });


                    },
                    child: Container(
                        height: 200,
                        margin: EdgeInsets.only(
                          left: 10,
                          bottom: 20,
                          right: 5,
                        ),
                        width: (w - 30) / 2,
                        decoration: BoxDecoration(
                            color: Dimensions.color,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  offset: Offset(1, 1),
                                  blurRadius: 10),
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  offset: Offset(0, 0),
                                  blurRadius: 10)
                            ]),
                        child: Container(
                          padding: EdgeInsets.only(
                            top: 5,
                            left: 10,
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      controller.foodTypeList[index].title!,
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Delivery Time',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        '20 mins',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  ),
                                  CircleAvatar(
                                    radius: 46,
                                    backgroundImage: NetworkImage(
                                        AppVariables.BASE_URI +
                                            "/uploads/" +
                                            controller.foodTypeList[index]
                                                .thumbnail!),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: 30,
                                    width: 70,
                                    decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Center(
                                      child: Text(
                                        'Order',
                                        style: TextStyle(
                                            color: Dimensions.color,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(bottom: 5),
                                        child: Text(
                                          '\$',
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      ),
                                      Text(
                                          controller.foodTypeList[index].price!
                                              .toString(),
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600))
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        )),
                  );
                },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 1),
              ),
            );
          }),
        ));
  }
}
