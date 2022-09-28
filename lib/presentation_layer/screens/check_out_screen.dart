import 'dart:core';

import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ifood/app_constants/dimensions.dart';
import 'package:ifood/app_constants/text_styles.dart';

import '../../app_constants/app_variables.dart';
import '../../app_constants/custom_snackbar.dart';
import '../../app_constants/reuseable_widgets/app_icon.dart';
import '../../app_constants/reuseable_widgets/profile-page.dart';
import '../../app_constants/route_helper.dart';
import '../controllers/cart_controller.dart';
import '../controllers/food_controller.dart';
import '../controllers/user_controller.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({Key? key}) : super(key: key);

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {@override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  // // WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
  // //
  // // });
  // }
  @override
  String _ref = 'IOSRef1278';


  var controller = Get.find<CartController>();


  int? selectedRadioTile;
  setSelectedRadioTile(var val) {
    setState(() {
      selectedRadioTile = val;
    });
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.white,
      endDrawer: MenuScreen(),
      appBar: AppBar(
        titleSpacing: 0.0,
        title: Row(
          children: [
            IconButton(
                onPressed: () {
                  Get.toNamed(RouteHelper.getCartPage());
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
        height: 440,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: EdgeInsets.only(top: 5),
              child: Row(
                children: [
                  Text('Payment Method',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w400)),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 180,
              width: 400,
              decoration: BoxDecoration(color: Dimensions.color, boxShadow: [
                BoxShadow(
                    offset: Offset(-1, -1),
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 10),
                BoxShadow(
                    offset: Offset(1, 1),
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 10)
              ]),
              child: Column(
                  children: RadioButtonitems.all.map(buildItem).toList()),
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Estimated delivery Time',
                      style: TextStyle(color: Colors.black, fontSize: 14),
                    ),
                    SizedBox(
                      width: 100,
                    ),
                    Row(
                      children: [
                        Icon(Icons.access_time_outlined, color: Colors.grey),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          '30 mins',
                          style: TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 15,
                ),
                RichText(
                  text: TextSpan(
                      text: '\$' + (controller.totalPrice + 10).toString(),
                      style: TextStyle(
                          fontSize: 30,
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
                SizedBox(
                  height: 10,
                ),
                Text(
                  '+' + '\$10' + '(delivery fee)',
                  style: TextStyle(color: Colors.black, fontSize: 12),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                print(('amount${controller.totalPrice + 10}'));
                Get.toNamed(RouteHelper.getCheckOut());
                controller.addToCartHistoryList();
                if (Get.find<UserController>().user.isEmpty) {
                  Get.toNamed(RouteHelper.getSignin());
                } else {
                  var user = Get.find<UserController>().user[0].email;
                  if (selectedRadioTile == 0) {
                    showCustomSnackBar('Please select payment method');
                  } else {
                    var amount = controller.totalPrice;
                    print(amount);
                    // _makePayment(context, user!, amount.toString());
                  }

                  print(('amount+${controller.totalPrice + 10}'));
                }
              },
              child: Container(
                margin: EdgeInsets.only(left: 250),
                height: 40,
                width: 100,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(5)),
                child: Center(
                  child: Text(
                    'Check out',
                    style: TextStyle(
                        color: Dimensions.color,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
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

                Padding(
                  padding: const EdgeInsets.only(left: 13, top: 40),
                  child: Text('Cart item' +
                      '(s): ' +
                      controller.getItems.length.toString()),
                )
              ],
            ),
            for (int i = 0; i < controller.getItems.length; i++)
              Container(
                margin: EdgeInsets.all(12),
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
                        Text(controller.getItems[i].name.toString()),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [

                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              '01',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),

                          ],
                        ),
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
                            SizedBox(
                              width: 150,
                            ),
                            Container(
                                child: Icon(
                              FontAwesomeIcons.heart,
                              size: 16,
                              color: Colors.black,
                            )),
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
  }

  // void _makePayment(BuildContext context, String email, String amount) async {
  //   try {
  //     Flutterwave flutterwave = Flutterwave.forUIPayment(
  //         context: this.context,
  //         encryptionKey: "FLWSECK_TEST174ca0c95cca",
  //         publicKey: "FLWPUBK_TEST-d16184263ad0924032be8fd047a1fd55-X",
  //         currency: 'NGN',
  //         amount: amount,
  //         email: "$email",
  //         fullName: "Ujunwa Fatima",
  //         txRef: _ref,
  //         isDebugMode: true,
  //         phoneNumber: "0123456789",
  //         acceptCardPayment: selectedRadioTile == 2 ? true : false,
  //         acceptUSSDPayment: false,
  //         acceptAccountPayment: selectedRadioTile == 3 ? true : false,
  //         acceptFrancophoneMobileMoney: false,
  //         acceptGhanaPayment: false,
  //         acceptMpesaPayment: false,
  //         acceptRwandaMoneyPayment: true,
  //         acceptUgandaPayment: false,
  //         acceptZambiaPayment: false);
  //
  //     final ChargeResponse response =
  //         await flutterwave.initializeForUiPayments();
  //     if (response == null) {
  //       print('Transaction failed');
  //     } else {
  //       if (response.status == 'success') {
  //         print(response.data);
  //         print(response.message);
  //       } else {
  //         print(response.message);
  //       }
  //       print(response.status);
  //     }
  //   } catch (error) {
  //     print(error);
  //   }
  // }

  Widget buildItem(RadioButtonItem item) {
    return RadioListTile(
      value: item.value,
      groupValue: selectedRadioTile,
      title: Text(
        item.text,
        style: TextDimension.style14Black,
      ),
      onChanged: ((val) {
        setSelectedRadioTile(val);
        print(selectedRadioTile);


      }),
      activeColor: Colors.black,
      selected: true,
    );
  }
}

class RadioButtonItem {
  final String text;
  int value;
  RadioButtonItem({required this.text, this.value = 1});
}
//constructure must be a constant variable for you to use its instance as const

class RadioButtonitems {
  static final payOnDelivery =
      RadioButtonItem(text: 'Pay on delivery', value: 1);
  static final payWithCreditCard =
      RadioButtonItem(text: 'Pay with credit card', value: 2);
  static final payWithBankTransfer =
      RadioButtonItem(text: 'Pay with bank transfer', value: 3);
  static final all = [
    payOnDelivery,
    payWithCreditCard,
    payWithBankTransfer,
  ];
}
