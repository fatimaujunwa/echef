import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ifood/app_constants/text_styles.dart';
import 'package:intl/intl.dart';

import '../../app_constants/app_variables.dart';
import '../../app_constants/dimensions.dart';
import '../../app_constants/reuseable_widgets/order_container.dart';
import '../../app_constants/reuseable_widgets/profile-page.dart';
import '../../app_constants/route_helper.dart';
import '../../domain_layer/models/cart_model.dart';
import '../controllers/cart_controller.dart';
import '../controllers/food_controller.dart';

class OrderHistoryScreen extends StatefulWidget {
  const OrderHistoryScreen({Key? key}) : super(key: key);

  @override
  State<OrderHistoryScreen> createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  bool tap = false;
  @override
  Widget build(BuildContext context) {
    //TODO NOTE THAT IF YOU HAVE TO CALL A VOID CONTROLLER METHOD THAT IS TO MAKE CHANGES TO A WIDGET DYNAMICALLY
    //TODO THEN YOU MUST WRAP AROUND GETBUILDER
    //

    var history = Get.find<CartController>().getCartHistoryList();

    Map<String, int> historyList = {};
    for (int j = 0; j < history.length; j++) {
      if (historyList.containsKey(history[j].time)) {
        historyList.update(history[j].time!, (value) => ++value);
      } else {
        historyList.putIfAbsent(history[j].time!, () => 1);
      }
    }
    List<String> cartOrderTime() {
      return historyList.entries.map((e) {
        return e.key;
      }).toList();
    }

    List<int> orderLIst() {
      return historyList.entries.map((e) {
        return e.value;
      }).toList();
    }

    List<int> orderPerList = orderLIst();
    var saveCounter = 0;

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
                width: 100,
              ),
              Text(
                'Orders',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 16),
              )
            ],
          ),
          backgroundColor: Colors.white,
          elevation: 0.0,
          // iconTheme: IconThemeData(color: Colors.black, size: 40),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 60,
                  ),
                  Text(orderPerList.length.toString() + '  item' + '(s)')
                ],
              ),
              for (int i = 0; i < orderPerList.length; i++)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    (() {
                      DateTime parseDate = DateFormat("yyyy-MM-dd HH:mm:ss")
                          .parse(history[i].time!);
                      var inputData = DateTime.parse(parseDate.toString());
                      var outputFormat = DateFormat("MM/dd/yyyy hh:mm:a");
                      var outputDate = outputFormat.format(inputData);
                      return Row(
                        children: [
                          Container(
                              margin: EdgeInsets.only(
                                  top: 20, bottom: 20, left: 90),
                              child: Text(outputDate)),
                        ],
                      );
                    }()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 90,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: orderPerList[i],
                              shrinkWrap: true,
                              itemBuilder: (_, i) {
                                if (saveCounter < history.length) {
                                  saveCounter++;
                                }

                                return i <= 2
                                    ? Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: CircleAvatar(
                                          radius: 40,
                                          backgroundImage: NetworkImage(
                                              AppVariables.BASE_URI +
                                                  "/uploads/" +
                                                  history[saveCounter - 1]
                                                      .img!),
                                        ),
                                      )
                                    : Container();
                              }),
                        ),
                        GestureDetector(
                          onTap: () {
                            var orderTime = cartOrderTime();
                            Map<int, CartProducts> moreOder = {};
                            for (int j = 0; j < history.length; j++) {
                              if (history[j].time == orderTime[i]) {
                                print('product' + history[j].id!.toString());
                                moreOder.putIfAbsent(
                                    history[j].id!,
                                    () => CartProducts.fromJson(
                                        jsonDecode(jsonEncode(history[j]))));
                              }
                            }
                            Get.find<CartController>().setItems = moreOder;
                            Get.find<CartController>().addToCart();
                            Get.toNamed(RouteHelper.getOrderToCart());
                          },
                          child: Container(
                            margin: EdgeInsets.only(right: 15),
                            height: Dimensions.h32,
                            width: Dimensions.w51,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(5)),
                            child: Center(
                              child: Text(
                                'View more',
                                style: TextDimension.style16w400,
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                )
            ],
          ),
        ));
  }
}
