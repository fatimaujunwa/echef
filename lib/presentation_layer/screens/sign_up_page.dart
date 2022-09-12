import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ifood/app_constants/dimensions.dart';
import 'package:ifood/app_constants/text_styles.dart';

import '../../app_constants/custom_snackbar.dart';
import '../../app_constants/reuseable_widgets/underlined_textfield.dart';
import '../../app_constants/route_helper.dart';
import '../../domain_layer/models/sign_up_model.dart';
import '../controllers/user_controller.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController phoneNumberController = TextEditingController();
    TextEditingController usernameController = TextEditingController();
    void signUp() {
      String email = emailController.text.trim();
      String password = passwordController.text.trim();
      String phonenumber = phoneNumberController.text.trim();
      String username = usernameController.text.trim();
      if (email.isEmpty) {
        showCustomSnackBar('email field is required');
      }
      if (password.isEmpty) {
        showCustomSnackBar('password field is required');
      }
      if (phonenumber.isEmpty) {
        showCustomSnackBar('phonenumber field is required');
      }
      if (username.isEmpty) {
        showCustomSnackBar('username field is required');
      } else {
        if (password.length < 6) {
          showCustomSnackBar('password should be greater than 6');
        } else {
          Get.find<UserController>().register({
            "username": username,
            "email": email,
            "phonenumber": phonenumber,
            "password": password
          })
            ..then((value) {
              if (Get.find<UserController>().loaded) {
                showCustomSnackBar('Account Created Successfully');
              } else {
                // print(Get.find<UserController>().loaded);
                showCustomSnackBar('Incorrect email and password combination');
              }
            });
        }
      }
    }

    return Scaffold(
      body: Stack(children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/foodwall1.jpg'), fit: BoxFit.cover),
          ),
        ),
        Positioned(
            top: Dimensions.h118,
            left: 0,
            right: 0,
            child: Container(
              height: Dimensions.h - Dimensions.h100,
              color: Colors.white,
            )),
        Positioned(
            top: Dimensions.h20,
            left: 0,
            right: 0,
            child: Container(
              height: Dimensions.h100,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/Sign up page image.png'),
                    fit: BoxFit.cover),
              ),
            )),
        Positioned(
            top: Dimensions.h80,
            left: 0,
            right: 0,
            child: Container(
              margin: EdgeInsets.only(
                  left: Dimensions.w30,
                  right: Dimensions.w30,
                  top: Dimensions.h60),
              height: Dimensions.h800,
              child: Form(
                child: Column(
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Text('Sign in', style: TextDimension.style12),
                          Expanded(child: Container()),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(RouteHelper.getSignup());
                            },
                            child: Container(
                                height: Dimensions.h100,
                                width: Dimensions.w100,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      top: Dimensions.h35,
                                      left: Dimensions.w105,
                                      child: CircleAvatar(
                                        backgroundColor:
                                            Colors.grey.withOpacity(0.5),
                                        radius: Dimensions.h20,
                                      ),
                                    ),
                                    Positioned(
                                        top: Dimensions.h40,
                                        left: Dimensions.w62,
                                        child: Text(
                                          'Sign up',
                                          style: TextDimension.style16,
                                        )),
                                  ],
                                )),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.h60,
                    ),
                    UnderlinedTextField(
                        controller: usernameController,
                        text: 'Username',
                        icon: Icons.contact_page_outlined),
                    SizedBox(
                      height: Dimensions.h50,
                    ),
                    UnderlinedTextField(
                        controller: emailController,
                        text: 'Email',
                        icon: Icons.email),
                    SizedBox(
                      height: Dimensions.h50,
                    ),
                    UnderlinedTextField(
                        controller: phoneNumberController,
                        text: 'Phone number',
                        icon: Icons.phone),
                    SizedBox(
                      height: Dimensions.h50,
                    ),
                    UnderlinedTextField(
                        controller: passwordController,
                        text: 'Password',
                        icon: Icons.password),
                    SizedBox(
                      height: Dimensions.h100,
                    ),
                    GestureDetector(
                      onTap: () {
                        signUp();
                      },
                      child: Container(
                        height: Dimensions.h50,
                        width: 190,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          border: Border.all(width: 2, color: Colors.black),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Center(
                            child: Text(
                          'Submit',
                          style: TextDimension.style14,
                        )),
                      ),
                    ),
                  ],
                ),
              ),
            ))
      ]),
    );
  }
}
