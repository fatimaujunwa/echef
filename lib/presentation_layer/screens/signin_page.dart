import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ifood/app_constants/dimensions.dart';

import '../../app_constants/custom_snackbar.dart';
import '../../app_constants/reuseable_widgets/underlined_textfield.dart';
import '../../app_constants/route_helper.dart';
import '../../app_constants/text_styles.dart';
import '../controllers/user_controller.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignInPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  void signIn() {
    var userController = Get.find<UserController>();
    String emailController = email.text.trim();
    String passwordController = password.text.trim();
    if (emailController.isEmpty) {
      showCustomSnackBar('email field is required');
    }
    if (passwordController.isEmpty) {
      showCustomSnackBar('password field is required');
    } else {
      if (password.text.length < 6) {
        showCustomSnackBar('password should be greater than 6');
      } else {
        userController
            .login({"email": emailController, "password": passwordController})
          ..then((status) {
            if (Get.find<UserController>().loaded) {
              showCustomSnackBar('Success', isError: false);
              Get.toNamed(RouteHelper.getFoodScreen());
              print(Get.find<UserController>().loaded);
            } else {
              // print(Get.find<UserController>().loaded);
              showCustomSnackBar('Incorrect email and password combination');
            }
          });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TextDimension.WhiteColor,
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
                    image: AssetImage('images/Sign in page image.png'),
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
              child: Column(
                children: [
                  Container(
                    child: Row(
                      children: [
                        Container(
                          height: Dimensions.h100,
                          width: Dimensions.w100,
                          child: Stack(
                            children: [
                              Positioned(
                                top: Dimensions.h25,
                                left: Dimensions.w26,
                                child: CircleAvatar(
                                  backgroundColor: Colors.grey.withOpacity(0.5),
                                  radius: Dimensions.h20,
                                ),
                              ),
                              Positioned(
                                top: Dimensions.h35,
                                left: Dimensions.w80,
                                child: Text('Sign in',
                                    style: TextDimension.style16),
                              )
                            ],
                          ),
                        ),
                        Expanded(child: Container()),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(RouteHelper.getSignup());
                          },
                          child: Container(
                            child: Text(
                              'Sign up',
                              style: TextDimension.style12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Dimensions.h60,
                  ),
                  UnderlinedTextField(
                    controller: email,
                    text: 'Email',
                    icon: Icons.email,
                  ),
                  SizedBox(
                    height: Dimensions.h50,
                  ),
                  UnderlinedTextField(
                    controller: password,
                    text: 'Password',
                    icon: Icons.password,
                  ),
                  SizedBox(
                    height: Dimensions.h60,
                  ),
                  GestureDetector(
                    onTap: () {
                      signIn();
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: Dimensions.h25,
                      child: Icon(
                        FontAwesomeIcons.signOutAlt,
                        size: Dimensions.h20,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Dimensions.h40,
                  ),
                  Text(
                    'or',
                    style: TextDimension.style14,
                  ),
                  SizedBox(
                    height: Dimensions.h40,
                  ),
                  RoundedContainer(
                    text: 'Sign in with google',
                  ),
                  SizedBox(
                    height: Dimensions.h15,
                  ),
                  RoundedContainer(
                    text: 'Sign in with facebook',
                  ),
                ],
              ),
            ))
      ]),
    );
  }
}

class RoundedContainer extends StatelessWidget {
  const RoundedContainer({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: Dimensions.h50,
        width: Dimensions.w300,
        decoration: BoxDecoration(
          border: Border.all(width: 2, color: Colors.black),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Text(text, style: TextDimension.style14),
        ));
  }
}
